Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E532DC433ED
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 15:25:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C399861108; Thu,  8 Apr 2021 15:25:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8210B6112F;
	Thu,  8 Apr 2021 15:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617895500;
	bh=NU1XkqpDdBdsylOcd13eBVFg4/QrIaL80jqI/Vj3b38=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PMbQA50lW04cvOsdNlwpzO5RMtmerPvug92fupMuTyYIJzck8/OAtctn9TDZnz8PS
	 uAwC+6hhSK7AciO/f8dv6athaJZsN/6pGtW2KiODqyyjjVoNyRsWeBNvlf9yQ9z7/Q
	 27V1mt1eIdvcLrI+CckCKnpE4th0VxTxG9QoE+Nc/MLLE8Ak6LQTxpBBNLmW3AzBuq
	 uag2qGX1qV3xB8O4vtrZR69I2Dbyq+lzWbgLGC8HbAhV0remYmeVITHT4PAGa+3s6G
	 Xg4ECQC9v8wGo+DYaJi0ndAHjrCW3mGU2vrnRnktbXvNAiCEGW9GZ6hhsqQXtAHAgN
	 Le7eHWFmDz+3w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	Nishanth Menon <nm@ti.com>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Tero Kristo <kristo@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] arm64: dts: TI K3 updates for v5.13
Date: Thu,  8 Apr 2021 17:24:26 +0200
Message-Id: <161789493785.1630479.2066806618809349698.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210405155336.smohb7uzkperqwuz@reflex>
References: <20210405155336.smohb7uzkperqwuz@reflex>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 5 Apr 2021 10:53:36 -0500, Nishanth Menon wrote:
> Please pull the following device tree changes for v5.13 cycle.
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/dt, thanks!

There are a couple added warnings from 'make W=1 dtbs_check' though:

ti/k3-am64-main.dtsi:376.40-385.4: Warning (simple_bus_reg): /bus@f4000/interrupt-controller0: missing or empty reg/ranges property
ti/k3-am64-main.dtsi:45.13-135.4: Warning (simple_bus_reg): /bus@f4000/dmss: missing or empty reg/ranges property
ti/k3-am64-mcu.dtsi:77.39-86.4: Warning (simple_bus_reg): /bus@f4000/bus@4000000/interrupt-controller1: missing or empty reg/ranges property

ti/k3-am642-evm.dt.yaml: bus@4000000: interrupt-controller1: {'type': 'object'} is not allowed for {'compatible': ['ti,sci-intr'], 'ti,intr-trigger-type': [[1]], 'interrupt-controller': True, 'interrupt-parent': [[1]], '#interrupt-cells': [[1]], 'ti,sci': [[4]], 'ti,sci-dev-id': [[5]], 'ti,interrupt-ranges': [[0, 104, 4]], 'phandle': [[5]]}
ti/k3-am642-evm.dt.yaml: bus@f4000: dmss: {'type': 'object'} is not allowed for {'compatible': ['simple-mfd'], '#address-cells': [[2]], '#size-cells': [[2]], 'dma-ranges': True, 'ranges':  'phandle': [[7]]}}
ti/k3-am642-evm.dt.yaml: bus@f4000: interrupt-controller0: {'type': 'object'} is not allowed for {'compatible': ['ti,sci-intr'], 'ti,intr-trigger-type': [[1]], 'interrupt-controller': True, 'interrupt-parent': [[1]], '#interrupt-cells': [[1]], 'ti,sci': [[4]], 'ti,sci-dev-id': [[3]], 'ti,interrupt-ranges': [[0, 32, 16]], 'phandle': [[15]]}
ti/k3-am642-evm.dt.yaml: flash@0: 'cdns,read-delay', 'cdns,tchsh-ns', 'cdns,tsd2d-ns', 'cdns,tshsl-ns', 'cdns,tslch-ns' do not match any of the regexes: '^partition@', 'pinctrl-[0-9]+'
ti/k3-am642-sk.dt.yaml: bus@4000000: interrupt-controller1: {'type': 'object'} is not allowed for {'compatible': ['ti,sci-intr'], 'ti,intr-trigger-type': [[1]], ...
ti/k3-am642-sk.dt.yaml: bus@f4000: dmss: {'type': 'object'} is not allowed for {'compatible': ['simple-mfd'], ...
ti/k3-am642-sk.dt.yaml: bus@f4000: interrupt-controller0: {'type': 'object'} is not allowed for {'compatible': ['ti,sci-intr'], 'ti,intr-trigger-type': [[1]], 'interrupt-controller': True, 'interrupt-parent': [[1]], '#interrupt-cells': [[1]], 'ti,sci': [[4]], 'ti,sci-dev-id': [[3]], 'ti,interrupt-ranges': [[0, 32, 16]], 'phandle': [[11]]}
ti/k3-am642-sk.dt.yaml: flash@0: 'cdns,read-delay', 'cdns,tchsh-ns', 'cdns,tsd2d-ns', 'cdns,tshsl-ns', 'cdns,tslch-ns' do not match any of the regexes: '^partition@', 'pinctrl-[0-9]+'
ti/k3-j7200-common-proc-board.dt.yaml: flash@0: 'cdns,read-delay', 'cdns,tchsh-ns', 'cdns,tsd2d-ns', 'cdns,tshsl-ns', 'cdns,tslch-ns' do not match any of the regexes: '^partition@', 'pinctrl-[0-9]+'


merge commit: 4b8cf90637f295ff1cb1f4bdfde134dab1196296

       Arnd
