Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C262C433FE
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 20:30:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1A09B23CD4; Wed,  9 Dec 2020 20:30:45 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Daniel Palmer <daniel@0x0f.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	robh@kernel.org,
	w@1wt.eu,
	olof@lixom.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/10] ARM: mstar: Add basic support for i2m and SMP
Date: Wed,  9 Dec 2020 21:30:36 +0100
Message-Id: <160754580092.2405127.3766119889615848962.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201134330.3037007-1-daniel@0x0f.com>
References: <20201201134330.3037007-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Dec 2020 22:43:20 +0900, Daniel Palmer wrote:
> Sorry for spamming this. I wanted to fix the DT parts
> before anyone spent time looking at the DT related commits
> in v1.
> 
> This series adds basic support for the infinity2m series
> of chips. For now the SigmaStar SSD202D which is a dual
> Cortex A7 in a QFN128 package.
> 
> [...]

Applied to arm/dt, thanks!

[01/10] dt-bindings: mstar: Add binding details for mstar,smpctrl
        commit: 80e73332ee829cd55d86272b7d3d4d5f0fc4c4ff
[02/10] dt-bindings: vendor-prefixes: Add honestar vendor prefix
        commit: 43181b5d8072dd92513dca995789a1a1123ffc8a
[03/10] dt-bindings: mstar: Add Honestar SSD201_HT_V2 to mstar boards
        commit: 8c50a8b359c4f262a05ed5fb05373177d11bd20c
[04/10] ARM: mstar: Add infinity2m support
        commit: ba2290b1b7505b28912092a0976e071a447ee18c
[05/10] ARM: mstar: Add common dtsi for SSD201/SSD202D
        commit: 572ef97bc7341b45c721d79f98262c4adb25919c
[06/10] ARM: mstar: Add chip level dtsi for SSD202D
        commit: dbbaf35d589e554d5956780282feb5d62d7f2af6
[07/10] ARM: mstar: Add dts for Honestar ssd201htv2
        commit: 418cb58b45661724ba145bd769e53910ad9324b0
[08/10] ARM: mstar: Add smp ctrl registers to infinity2m dtsi
        commit: 570e471ce0540165aed5bc638e462de7c1110a28
[09/10] ARM: mstar: Wire up smpctrl for SSD201/SSD202D
        commit: ecaafac1eb73de8209680ec030769a2def4801e5
[10/10] ARM: mstar: SMP support
        commit: 5919eec0f09214901b09faeaf6341addebc57a89

       Arnd
