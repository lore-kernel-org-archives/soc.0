Return-Path: <SRS0=xpWt=HN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E7CC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Feb 2021 10:00:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BF9364E87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Feb 2021 10:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BF9364E87
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I1cgOTw5pxVaqHGaN0YfcluEdNE6i2/bLoR92WiGtrs=; b=wNmslLMo3HSwiE/abIfq3pA8Vc
	9nYwi/cdvPZbz7MTFyLESSZmPHeLclmKJ2hRcqCuGP0JEmRh0yovM4ARhZlAwajeZMMeksmhCcbHx
	gq50RpUgIalTmvr7okd5ZhR8riRMy9OjFVhjmUF9Pilj9Hjhkqioaf5bD0+Is5LRH1i+DMtzBx0+w
	FJyXMD/yepvmn7e76+qW+BXwtIjl1iCR91qopqK27WJkDF/L2vsADaI1A5/yd5rznaYopxqa1VOUY
	fW49U64B2Genz5ppwtuyjjs/OmyYrSQLVUsc9oYWhUZnk+6CgASXnR6P8PMzW5WvFcXoOUqE+5Zun
	rIN3Ye4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lA8l9-0000dW-7Y; Thu, 11 Feb 2021 09:59:39 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lA8l5-0000cU-Ly
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Feb 2021 09:59:36 +0000
Received: by mail-ed1-x534.google.com with SMTP id s11so6312447edd.5
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 11 Feb 2021 01:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=ngz90GTrvLzbG2BfdzIsnPJ98qYrRWMZRN1INwXEI6g=;
 b=msqKad3cd/oOCtNrzujnqcl1vNalNNGtKMezuT87N5vQMrh6dFhiosXALf8Ome8d2v
 /spj7PgxBZvfcRY5unqVmgFXLV3z/Z3CJhAbNMmW4lHowlJEbcfiCq13HiOFdC6tccr0
 PUvlgFs3/OthU2oJNOZJXeGplub5U2OqDWUPl4Y9Q343wgCAPM4X6cEZ1xdnW9NHgn9s
 bUc3VYzOMlj/9KMk5sG7/CmkJ1TpclzIbmGKxjxh5pol4Q8nnek9YgRQRQJLMTJHU8j3
 n1pBZzunU9LpYS0g01tRwQUoXa/VP9JlX9LIrWNSAFgzFt+zfiqAZYLcpCeTz4GqNW/9
 5eLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=ngz90GTrvLzbG2BfdzIsnPJ98qYrRWMZRN1INwXEI6g=;
 b=Db9Co9Ub/GUCEUFhAJRNNjxdJfPgmCGhSkUEdbalY9l3jSeLxmtMO6T8eZwZaVLRAl
 A6KsIFudiruJThc3eglfDAtvtT3HDNF5GGnkXpJDH3rqJpgXKt31qILB1D5Yvb5vOguH
 1ljdKC0JphsoW4GZn7XofyqqMNfWR1dEvg1udzYSj23ZTBpxu1LXzJA+rB9YR27LFAdn
 TKWrtjWfCDP/LTHi+CTUMGv6K6OANCYLs0L1eFzqCvbkywZw6cLlZvRN1sr3QBszurb2
 ZLbb3KsCjU6gQ4ISARwBBgKoExUvzPGHnb8MPayTpCYA8gDlte6V3OW9tAxUTL8dw+B2
 78fQ==
X-Gm-Message-State: AOAM532NtEjI08ksZoMVENpZpFKrmO2nIlv6l6BgEjHDC90aQ3LFahVD
 niG/2+JAqH3jT8zsojIplLMYQSliY2l9NA==
X-Google-Smtp-Source: ABdhPJw4lNxsQVVMiXCd1h4okyOFMQO0a2/6YsICdD6BULpCZZjib9dZHTG/ZhT4B0PzESqcfEsRqw==
X-Received: by 2002:a05:6402:3198:: with SMTP id
 di24mr7548385edb.340.1613037571314; 
 Thu, 11 Feb 2021 01:59:31 -0800 (PST)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
 by smtp.gmail.com with ESMTPSA id b11sm3831268eja.115.2021.02.11.01.59.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 01:59:30 -0800 (PST)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] ARM: dts zynq: Xilinx DT changes for v5.12
Message-ID: <90f55633-98ca-e67f-313c-26ccc5297149@monstr.eu>
Date: Thu, 11 Feb 2021 10:59:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_045935_774268_E5D8200E 
X-CRM114-Status: GOOD (  17.15  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: arm-soc <arm@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210211095930.UeFwgLlZkEyImPRuE4Nc6RzhSjhbAMaffaLeHCc5bfw@z>

Hi,

please pull the following DT changes to your tree. The major part is
adding one new board and qspi dt binding conversion.

Thanks,
Michal

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynq-dt-for-v5.12

for you to fetch changes up to 4e1d557c6ad893c71bcfb6cea62176ba9cca5399:

  dt-bindings: spi: zynq: Convert Zynq QSPI binding to yaml (2021-02-11
10:38:55 +0100)

----------------------------------------------------------------
ARM: dts: Zynq DT changes for v5.12

- Add Ebang board support
- Add missing zturn boards in dt binding
- Update copyrights
- And convert Zynq QSPI binding

----------------------------------------------------------------
Michael Walle (4):
      dt-bindings: add ebang vendor prefix
      dt-bindings: arm: add Ebang EBAZ4205 board
      ARM: dts: add Ebang EBAZ4205 device tree
      ARM: dts: ebaz4205: add pinctrl entries for switches

Michal Simek (3):
      dt-bindings: arm: xilinx: Add missing Zturn boards
      ARM: zynq: Update Copyright date in DTS
      dt-bindings: spi: zynq: Convert Zynq QSPI binding to yaml

 Documentation/devicetree/bindings/arm/xilinx.yaml         |   3 +++
 Documentation/devicetree/bindings/spi/spi-zynq-qspi.txt   |  25
-------------------------
 Documentation/devicetree/bindings/spi/xlnx,zynq-qspi.yaml |  59
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml    |   2 ++
 MAINTAINERS                                               |   1 +
 arch/arm/boot/dts/Makefile                                |   1 +
 arch/arm/boot/dts/zynq-7000.dtsi                          |   2 +-
 arch/arm/boot/dts/zynq-cc108.dts                          |   2 +-
 arch/arm/boot/dts/zynq-ebaz4205.dts                       | 132
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/zynq-zc702.dts                          |   2 +-
 arch/arm/boot/dts/zynq-zc706.dts                          |   2 +-
 arch/arm/boot/dts/zynq-zc770-xm010.dts                    |   2 +-
 arch/arm/boot/dts/zynq-zc770-xm011.dts                    |   2 +-
 arch/arm/boot/dts/zynq-zc770-xm012.dts                    |   2 +-
 arch/arm/boot/dts/zynq-zc770-xm013.dts                    |   2 +-
 arch/arm/boot/dts/zynq-zed.dts                            |   2 +-
 arch/arm/boot/dts/zynq-zybo.dts                           |   2 +-
 17 files changed, 208 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-zynq-qspi.txt
 create mode 100644
Documentation/devicetree/bindings/spi/xlnx,zynq-qspi.yaml
 create mode 100644 arch/arm/boot/dts/zynq-ebaz4205.dts

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
