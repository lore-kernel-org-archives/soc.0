Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7271C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 14:42:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A37820829
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 14:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A37820829
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1qhIAaEg2dv5NMGuLpf2C7XoVZ0TpeuRypKIocbP9DY=; b=rmKevyMSQEey/PlrHUe7fMwsy0
	Lp10Bnuo224rFnAFWf1NZoeywirdy+ZOn8jPwcSC25GB2IQapodT1YsSfRS8OfiS0/Njsk8aRO1v3
	E/kpXB3kiLvM5TYC2g8/5TBmCfZwsV6UcrZ34anSNo7rbrp+va9bOMC6p1CGTv3yZx/AvYcszJm0N
	wPHReAc0BoPh/jMAPXsDgw+3tAJI0vSAUwSvqvj/hZ92heB9O8eZAnq9ZQbXV1juiDXhbvmzs5ck7
	atGUu6r4UlkEHZAAgG3SCbj5P1EoBzHd0nBqYwbm4RjEQZHtkHOsltv4WNkFZSGmpst5QUT+KB89r
	5y2xJNgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn0eh-0006Vl-82; Wed, 09 Dec 2020 14:41:23 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn0ee-0006VG-LJ
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 14:41:21 +0000
Received: by mail-ej1-x62e.google.com with SMTP id bo9so2430253ejb.13
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 09 Dec 2020 06:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=5dywgSQ0aQtEnwiqFifnZqRaC7VolhAVOBBw7J9VYnM=;
 b=u89SdTE8900uShQhz6lanO2LcvyD3H4IHStUbORrTInHQd+3xh6UghDhA0f/VCQStH
 6EvWj7KJpF8ffWBPgbUhWF4WTdqKJzZKEdFmqF2U7pVJ9rWg8oIKK8GMhpwrpafVjWd6
 9vR8/yV9pEJoS9V7owQX2TL0lBkOac2ieHQ5tB8S06Rxb06xlbvXss3VMLkqwFgBZRl3
 s0+ggPirXD7q5KrxOWZVK38yon7vZ30UdLZNHTPFVaFvWHktnVuoYp9Cah9l/tu17h0i
 BH8pKEP3+w7gLwU374SO4cNqxdPrStslgxYAfDDUPFWYHVK/7kAwXkOyIqgZQaXySmL6
 bXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=5dywgSQ0aQtEnwiqFifnZqRaC7VolhAVOBBw7J9VYnM=;
 b=RX+WKC86QeaWPW1CvF6NKvmFBnV+T6dbvBtBnLVWrKGQELg4pdCYnjKdyzsqCmjzLe
 GQNSFEp+ZSrLfg6bUFEX3dMRYLYO16M5GvNuV4JnscIH1MTg6JXspwQ0pxxYR6IXQhYD
 QPV4kjdYZ1TmITbsARkJRV62x3ok+r2YVmy4TwQ0WfrTL/vGXg0UyIUaChkTWbCX3d/D
 5T6ipZBvHMyIoozB9OSU5BOxGx5kD8fPe8X83tZrOw10Isk0D7O7AbSA6mPi3WjVOLsx
 NbTxNmYeGo6XfWfWIqsIiFH9Gzy7AxGv/7OECegHcU/3neV6K7zVAnYziPNrmq+zfY/Y
 Zivw==
X-Gm-Message-State: AOAM530c3O+VDjbKobCWsZnXBc2Af/bJoZo8QZ+2WFAOHDbUZ/2Zlnyn
 aAGv9oMhbiTWQzwPvrBd8Sj5HUMb3cQf15So
X-Google-Smtp-Source: ABdhPJy//CD1xynVfrEAeLGtucsiu2wm+tsGI0/9vsaGOUi4kll48rOCn7BavCErcnURv2aeeElOmQ==
X-Received: by 2002:a17:906:af5a:: with SMTP id
 ly26mr2311115ejb.416.1607524878876; 
 Wed, 09 Dec 2020 06:41:18 -0800 (PST)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
 by smtp.gmail.com with ESMTPSA id i24sm1684710ejx.31.2020.12.09.06.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 06:41:18 -0800 (PST)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] ARM: dts zynq: Xilinx DT changes for v5.11
Message-ID: <35b7d53a-f91d-9254-885b-5e45de8f9ce8@monstr.eu>
Date: Wed, 9 Dec 2020 15:41:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_094120_714380_6A780FBA 
X-CRM114-Status: GOOD (  15.75  )
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
Message-ID: <20201209144117.O5BiZeQUaoOQ8xgkS0zfDj4EHit4pADZpyOVbtuTm5E@z>

Hi,

pull pull the following patches to your tree.

Thanks,
Michal

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynq-dt-for-v5.10

for you to fetch changes up to a508f620b5a6e9b359a2baa46ec9a714c3e2f420:

  ARM: zynq: Fix incorrect reference to XM013 instead of XM011
(2020-12-09 15:20:11 +0100)

----------------------------------------------------------------
ARM: dts: zynq: DT changes for v5.11

- Adding support for Zturn-v5
- Small DT changes to clean errors from dt_binding_check

----------------------------------------------------------------
Alexandre GRIVEAUX (1):
      ARM: zynq: Add Z-turn board V5

Michal Simek (6):
      ARM: zynq: Fix compatible string for adi,adxl345 chip
      ARM: zynq: Rename bus to be align with simple-bus yaml
      ARM: zynq: Fix leds subnode name for zc702/zybo-z7
      ARM: zynq: Fix OCM mapping to be aligned with binding on zc702
      ARM: zynq: Convert at25 binding to new description on zc770-xm013
      ARM: zynq: Fix incorrect reference to XM013 instead of XM011

 arch/arm/boot/dts/Makefile               |   1 +
 arch/arm/boot/dts/zynq-7000.dtsi         |   2 +-
 arch/arm/boot/dts/zynq-zc702.dts         |   8 +++++++-
 arch/arm/boot/dts/zynq-zc770-xm011.dts   |   2 +-
 arch/arm/boot/dts/zynq-zc770-xm013.dts   |   7 +++----
 arch/arm/boot/dts/zynq-zturn-common.dtsi | 112
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/zynq-zturn-v5.dts      |  15 +++++++++++++++
 arch/arm/boot/dts/zynq-zturn.dts         | 101
+----------------------------------------------------------------------------------------------------
 arch/arm/boot/dts/zynq-zybo-z7.dts       |   2 +-
 9 files changed, 142 insertions(+), 108 deletions(-)
 create mode 100644 arch/arm/boot/dts/zynq-zturn-common.dtsi
 create mode 100644 arch/arm/boot/dts/zynq-zturn-v5.dts

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
