<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>

    <xsl:param name="output-filename" select="'output.txt'" />

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/*">
        <FileSet>
            <FileSetFiles>
                <FileSetFile>
                    <RelativePath>
                        <xsl:text>Airtable.xml</xsl:text>
                    </RelativePath>
                    <xsl:element name="FileContents">
                        <Airtable>
                            <GameLevels>
                                <xsl:for-each select="//Levels/Level">
                                    <xsl:sort select="MenuName" />
                                    <GameLevel>
                                        <Name>
                                            Level <xsl:value-of select="MenuName"/>
                                        </Name>
                                        <GameName>Cross Me</GameName>
                                        <PuzzleHeight>
                                            <xsl:value-of select="LevelHeight"/>
                                        </PuzzleHeight>
                                        <PuzzleWidth>
                                            <xsl:value-of select="LevelWidth"/>
                                        </PuzzleWidth>
                                        <GroupNumber>
                                            <xsl:value-of select="GroupNumber"/>
                                        </GroupNumber>
                                        <LevelNumber>
                                            <xsl:value-of select="LevelNumber"/>
                                        </LevelNumber>
                                    </GameLevel>
                                </xsl:for-each>
                            </GameLevels>
                            <LevelCells>
                                <xsl:for-each select="//Levels/Level">
                                    <xsl:sort select="MenuName" />
                                    <xsl:call-template name="add-level-cells">
                                        <xsl:with-param name="solution-binary" select="SolutionBinary" />
                                        <xsl:with-param name="level" select="." />
                                        <xsl:with-param name="x" select="0" />
                                        <xsl:with-param name="y" select="0" />
                                    </xsl:call-template>
                                </xsl:for-each>
                            </LevelCells>
                        </Airtable>
                    </xsl:element>
                </FileSetFile>
            </FileSetFiles>
        </FileSet>
    </xsl:template>

    <xsl:template name="add-level-cells">
        <xsl:param name="solution-binary" />
        <xsl:param name="level" />
        <xsl:param name="x" />
        <xsl:param name="y" />
        <xsl:variable name="first-character" select="substring($solution-binary, 1, 1)" />
        <xsl:variable name="rest-of-solution-binary" select="substring($solution-binary, 2, string-length($solution-binary))" />
        <xsl:if test="normalize-space($first-character) != ''">
            <LevelCell>
                <LevelMenuName>
                    <xsl:value-of select="$level/MenuName"/>
                </LevelMenuName>
                <GameName>Cross Me</GameName>
                <GroupNumber>
                    <xsl:value-of select="GroupNumber"/>
                </GroupNumber>
                <LevelNumber>
                    <xsl:value-of select="LevelNumber"/>
                </LevelNumber>
                <CellStateCategory>Answer</CellStateCategory>
                <Y>
                    <xsl:value-of select="$y"/>
                </Y>
                <X>
                    <xsl:value-of select="$x"/>
                </X>
                <CellStateName>
                    <xsl:choose>
                        <xsl:when test="$first-character = '0'">
                            <xsl:text>Not Selected</xsl:text>
                        </xsl:when>
                        <xsl:when test="$first-character = '1'">
                            <xsl:text>Selected</xsl:text>
                        </xsl:when>
                        <xsl:when test="normalize-space($first-character)=''"></xsl:when>
                        <xsl:otherwise>
                            <UNEXPECTED_CHARACTER>
                                <xsl:value-of select="$solution-binary"/>
                            </UNEXPECTED_CHARACTER>
                        </xsl:otherwise>
                    </xsl:choose>
                </CellStateName>
            </LevelCell>
        </xsl:if>
        <xsl:choose>
            <xsl:when test="normalize-space($first-character) = '' and string-length($rest-of-solution-binary) > 0">
                <xsl:call-template name="add-level-cells">
                    <xsl:with-param name="solution-binary" select="$rest-of-solution-binary" />
                    <xsl:with-param name="level" select="$level" />
                    <xsl:with-param name="x" select="$x" />
                    <xsl:with-param name="y" select="$y" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$x &lt; $level/LevelWidth - 1">
                <xsl:call-template name="add-level-cells">
                    <xsl:with-param name="solution-binary" select="$rest-of-solution-binary" />
                    <xsl:with-param name="level" select="$level" />
                    <xsl:with-param name="x" select="$x + 1" />
                    <xsl:with-param name="y" select="$y" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$y &lt; $level/LevelHeight - 1">
                <xsl:call-template name="add-level-cells">
                    <xsl:with-param name="solution-binary" select="$rest-of-solution-binary" />
                    <xsl:with-param name="level" select="$level" />
                    <xsl:with-param name="x" select="0" />
                    <xsl:with-param name="y" select="$y + 1" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
