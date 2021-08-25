Return-Path: <SRS0=+UL9=NQ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163D3C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Aug 2021 07:33:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8549C613D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Aug 2021 07:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8549C613D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xPMmb5T+tuiGXjVWsUaxUuq+CN5rkTl5QfXxhdJD0NE=; b=Pld7RHIC5KGC2j
	qbkIbQZTsooE5jJMEAEhieYDxUC1vjw5KqMQP+Bb1JJ04vRyPO6IYaKnoJVqrWDSCDxDOP3XWTCao
	IIhd4mejl6bIh3G1bm0ZHaLu0e3zL48EabQRVTjA/nsQY0XRqUjVdDO+HoBPVLpmLTG5vixvltlsd
	9fjxe+vvx+ftSlwgLwBOOCn4KLmHIJK2HbCOm5BDBnQ3OnKWyoM+PWKwqXNxqIn3zlQ9zDPsJ1w60
	a0ZyGypqZ9dmbi7qW1hcWkeljO/HfEW5GNP11TISOqdhSiLbonrfnI4Yz1xjZbZci1tnf3HoFneH0
	62f5+IXY6Y+R1eWEuVfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mInNt-005p7p-Dj; Wed, 25 Aug 2021 07:31:41 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mInNm-005p6U-Gb
 for linux-arm-kernel@lists.infradead.org; Wed, 25 Aug 2021 07:31:38 +0000
Received: by mail-ed1-x533.google.com with SMTP id dm15so10522748edb.10
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 25 Aug 2021 00:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=Uix0zP6cMyfE/QzBW8A2nUJhcMKISWo3miITx0Z1iE4=;
 b=vSouYeTswYT3DsXvnzEIC1ukeveAsbhKXyuJ856d6IUE6qdCekArll3S92LXd8oqSK
 RXSX7LKTUGS6R75yxoEs9GRlZ2N96ZhFPYitXdBlJTyoYcH5yBD2fDiAVWt26t4d+uzq
 caU4KE2qmrblH5N6rHt0ndUgZzvLB9lwqNRAw/yksdzSsU42AO9duChPrBciKZALyIvD
 CbwysJXdIpbpGSASowO/5tvdOJ+EeRbFZg2KbdVPuT7xsJ7u/8LywZhZmqlW0uIpr9yW
 PeO0gpeL1oIbpIdT3OwFR0wiyqiwQbXF7t+aK8U1m3mC/du/ocR69ufiyRlbRaOiSDWV
 Oprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=Uix0zP6cMyfE/QzBW8A2nUJhcMKISWo3miITx0Z1iE4=;
 b=c90xHX38j8bPxkMZzW2M93+P6m1Eu7+E2y3Sm63vK1Qxnz8nzlcxqMIKoAeV9826vh
 ZXssGSfvYkh5LuLENkDRAHOwmuCYKikgLyk3vi+AlG/r727egH9VLiptUW3MH6pHM+vH
 5X2r/XdToEc34iyu4fKRI3IH0wcplC1NJorfoAiseI4ZN0t8E5AofUlx2C3+YY4R2qT9
 KMprlHatqfXrYbbO7UPkVGNuTurD8g+cbqeCkLUtiAtMwL0DwIPd/Uu/ctvUoxaJif7O
 rVaEAp7u2NcibM5wEM0AGcg0hmp/uviztzMZHirmaDNhJmmOnTsYSHn4G/24gFXybohZ
 /3rQ==
X-Gm-Message-State: AOAM530oQNWnA8TDlw6466WY+61bF6g3T5OdjDmxVv620dB8vTwlVDbw
 ywvRzsTrWr4+6PAiiNlKdURakajie2X6on1x
X-Google-Smtp-Source: ABdhPJyPlxjqLM52IlNaVHrUj8uNYenpchf6u8jWSAQU5NLlVSRnqN+gMpwUiwHH3C2wWwhzdkzTYA==
X-Received: by 2002:a05:6402:1b10:: with SMTP id
 by16mr10099276edb.297.1629876692323; 
 Wed, 25 Aug 2021 00:31:32 -0700 (PDT)
Received: from ?IPv6:2a02:768:2307:40d6::e05? ([2a02:768:2307:40d6::e05])
 by smtp.gmail.com with ESMTPSA id d22sm10734452ejj.47.2021.08.25.00.31.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 00:31:32 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: arm-soc <arm@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] ARM: dts zynq: Xilinx SoC changes for v5.15
Message-ID: <5a25f882-103f-4df0-0d90-868d264c900b@monstr.eu>
Date: Wed, 25 Aug 2021 09:31:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_003134_604930_94FC8E49 
X-CRM114-Status: GOOD (  11.14  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210825073131.WQcs8_pCkbmdiyFuAdgRfUxWV3BjJaLs5lurHJ-Xync@z>

Hi,

please pull this one patch to your tree.

Thanks,
Michal

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynq-soc-for-v5.15

for you to fetch changes up to 75b4c5deef011c7d7b1e23b623455185d60e72a2:

  ARM: configs: multi_v7: enable PL35x NAND controller (2021-08-06
12:19:05 +0200)

----------------------------------------------------------------
ARM: dts: Zynq SoC changes for v5.15

- Enable PL35X nand driver in multi_v7_defconfig

----------------------------------------------------------------
Michael Walle (1):
      ARM: configs: multi_v7: enable PL35x NAND controller

 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

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
