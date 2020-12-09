Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85762C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 14:58:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1858623406
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 14:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1858623406
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gX0OL/HpXl3d9pZaNS2KYNhmaU68mpYt1yv8Hjc1ibE=; b=AzIw0qKNY48Xx3DHD44dsct1hi
	x8rYmsWTXN7gLrjggCuHj5bUT/pwoSW4MGV7i4CdcFyAaB1T1chEV0hwiJcBcSIVp3HOT7LYZLq4n
	veBnOFz8Qe2pxiR+/2SbKjT0GP6N5NC6ryCj/V/xWfUkhvMtZqmClBih/WFku+CyNmTzs1En32B7P
	DOiusZlBtaRj6faeewPFbTqdRwF/LfOE0xaO/mEMtMo3KWVU9SQpEduMkz0Oo2srZllONTaNLZGnh
	bMZ3K8SnjuU+MkeVqHTBp0rRGju87OFBOe1FniomP74sYQpqQCgY6lrUeTRJcqyDOTddCknqBDXiJ
	N03RPALg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn0tf-0008Bu-SP; Wed, 09 Dec 2020 14:56:51 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn0td-0008BD-Vx
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 14:56:50 +0000
Received: by mail-ej1-x635.google.com with SMTP id bo9so2505319ejb.13
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 09 Dec 2020 06:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=HTobQiEkNPueZE6gn6zK1PHE2porppz4XM3wXfiHmTU=;
 b=vvSkivXaEtra84rKVw+VoTz8wxgDbEWUsKlTtDsQkA4UABiabGOREMQLj+VYxnEdQD
 kQp9GVTUZCQtiip0RUEzRrUuZwKxjIaldOZIf4D/PctRZjKENkNkfXIaXzZfoK/aNjzr
 1iCA8JXt1Rk+kkWKckF+8uGZB3iyq4BTdbBzjewlNhbFxAT4p+7Ii2mWLAm0QRle8Jwn
 RWvqjEDFutjpR8SVaHT383wPGQKqOc4r2gJEbrQU14PIEH9H1WJ206bjZdDlp26LQQw0
 caXgiWZhkqHEdO3e2XJXKBUwKG7MfIdjJva7QeFrBaw5mc+kMoBOv8VuxgXRyCd8czDO
 cZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=HTobQiEkNPueZE6gn6zK1PHE2porppz4XM3wXfiHmTU=;
 b=YReytHZrlraUPd6ruz30eyDvJSjat0/QmR6WCYEEJ4fLn9A5hnIFWJxj6W066d3gVV
 f+4bOWX0EDve2RCBK11tBPtdrr4WFJCTnNe4fmeABHmDdkNlA5iN2wZEueEDNdxTWLu2
 RFoFH+Zwi+blAMXKDpXV/2Sl/xeacbvu1h+dM6bi3hm8ud8itNl1opZq9+UMpz7hk3tx
 vOcIO/6oq3kBMLxcgO+LknLP2rETUP4vo5LOegkQ+IGeC8ikeB97xOiTs3MTmzoYTJ1+
 KklaLH86VC5nwokLoTeZnTqpkOv3ICfjO2/euG5LYkddtjw8p/n/mDEqN0Mq0on9Ye6F
 4BmA==
X-Gm-Message-State: AOAM531MM8+yYqkj4YF1Vm0FT50JqgXQuZRc0LFZ0f3/gojDp6TSsrPZ
 pro64udxYNlBmctzKFlsP0EMAw8AL+LUkwnl
X-Google-Smtp-Source: ABdhPJwGnzHiUd0empsBytxeB5/baA5ZjlmpYE1RB1Q9fCwO0jz4UU/bGtJarEeFsmNQDJy4zwdpfg==
X-Received: by 2002:a17:906:9250:: with SMTP id
 c16mr2415277ejx.355.1607525808216; 
 Wed, 09 Dec 2020 06:56:48 -0800 (PST)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
 by smtp.gmail.com with ESMTPSA id r11sm1864865edt.58.2020.12.09.06.56.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 06:56:47 -0800 (PST)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] arm64: dts: ZynqMP DT changes for v5.11
Message-ID: <f460f6ac-d235-a33b-3d0f-ca904a43e687@monstr.eu>
Date: Wed, 9 Dec 2020 15:56:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_095650_046899_10F1B26E 
X-CRM114-Status: GOOD (  12.99  )
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
Message-ID: <20201209145647.6aiXuAU-XKwF9RboT4QikT1GLPFgG6CfuB_uwa_7nus@z>

Hi,

please pull the following changes to your tree.

Thanks,
Michal

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-dt-for-v5.11

for you to fetch changes up to 9854bc7dfa5f7661538b08dc44d5e6c8876832fb:

  arm64: dts: zynqmp: Wire mailbox with zynqmp-power driver (2020-11-25
13:29:54 +0100)

----------------------------------------------------------------
arm64: dts: ZynqMP DT changes for v5.11

- Wiring IPI communication channel with firmware driver
- Taking GIC to main bus to have only one
- Small fix in zynqmp.dtsi reported by dt_binding_check

----------------------------------------------------------------
Michal Simek (3):
      arm64: zynqmp: Move gic node to axi bus
      arm64: dts: zynqmp: Fix pcie ranges description
      arm64: dts: zynqmp: Wire mailbox with zynqmp-power driver

 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 60
+++++++++++++++++++++++++++++++++++++++---------------------
 1 file changed, 39 insertions(+), 21 deletions(-)

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
