Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F955C433B4
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 15:24:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 70979610FB; Thu,  8 Apr 2021 15:24:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 653F961139;
	Thu,  8 Apr 2021 15:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617895484;
	bh=JELiv0rbuI7a99pdo3R6EcIdli/kt8XWBiKOWNVrjkY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oQlnHLA+l069qUCLIxgLHzR/nLC2aQfQMaPlE/O40DGLk8GwS0B0MRXkMEPEpfuaO
	 pWw9a/DvebIapLJ/7CH/uzLg1kQbt4jbqR9dW9F/hDxZwiMf7UoziVweMz2P/K7k/I
	 gI2N2NA7cfXsYcSSGdG7Sfgi1CnewakXBAZQZXyXfS8EdTiimpuRUAx2ory8ytkU/9
	 oOwjvh89yNT3RvJyaoldFFt2VTRvz5I5JMLv5ELfgC2Wd3pEZSxa9639cgWxKaok0N
	 cH4+fboigtgHdmU9TDejaVS8cgMEBQxfbv2JLjXs6gcxvFx38Ol6qTn+Nu1PB2hBe6
	 WsoTauDPnEZzA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM DT updates for v5.13 (take two)
Date: Thu,  8 Apr 2021 17:24:20 +0200
Message-Id: <161789462010.1629934.8245364544434971043.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1617359678.git.geert+renesas@glider.be>
References: <cover.1617359678.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 2 Apr 2021 12:37:15 +0200, Geert Uytterhoeven wrote:
> 	Hi arm-soc folks,
> 
> The following changes since commit c8aebc1346522d3569690867ce3996642ad52e01:
> 
>   arm64: dts: renesas: r8a77980: Fix vin4-7 endpoint binding (2021-03-16 09:58:00 +0100)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/dt, thanks!

There were a couple of added warnings from 'make dtbs_check W=1':

renesas/r8a774a1-beacon-rzg2m-kit.dt.yaml: csi2@feaa0000: ports: 'port@0' is a required property
renesas/r8a779a0-falcon.dt.yaml: thermal-zones: 'sensor-thermal1', 'sensor-thermal2', 'sensor-thermal3', 'sensor-thermal4', 'sensor-thermal5' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
renesas/r8a779a0-falcon.dt.yaml: timer@e61e0000: compatible:0: 'renesas,tmu-r8a779a0' is not one of ['renesas,tmu-r8a7740', 'renesas,tmu-r8a774a1', 'renesas,tmu-r8a774b1', 'renesas,tmu-r8a774c0', 'renesas,tmu-r8a774e1', 'renesas,tmu-r8a7778', 'renesas,tmu-r8a7779', 'renesas,tmu-r8a7795', 'renesas,tmu-r8a7796', 'renesas,tmu-r8a77961', 'renesas,tmu-r8a77965', 'renesas,tmu-r8a77970', 'renesas,tmu-r8a77980', 'renesas,tmu-r8a77990', 'renesas,tmu-r8a77995']

merge commit: 85af259bcce7a4d6936da72fd84757502a2c5b5e

       Arnd
