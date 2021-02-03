Return-Path: <SRS0=Uajl=HF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB65C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Feb 2021 13:40:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F79E64E2B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Feb 2021 13:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F79E64E2B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ajECeptri92U1kccUcS+9b/AW214d+l+XaUvZcQ91Ig=; b=Q4v2zN9d6Ynfo9lGyYLQVlJD83
	r3SpOeBtQV2D6KKj4HyOCTYvdjmFK7wBRMTJV3LXBonXVp3iedumdfooy4zjdkTFSdW9s8wPorYO6
	gFkJIx3I0yYzXTiGp4vKcTA1yXKtodHBM82LoGwRKgxtjhex9WmM8ysW3d+hqFlS7kQgUcx7HEZmG
	BDzet1oiVQgd75YighfCZoGG1lLYt+5EVEo3Rn8F5GJKxfq7uP9kjNECDRjfMku78u0ZgbwRS97wC
	534JZgVCOCnhvh5r9gK9GTnxCsfChhsXwLQo/hkNmoRjFc6wawczrVic++RcCU/JQg/MP5MLEJcsW
	hrPl0QLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7IMW-0005d8-NN; Wed, 03 Feb 2021 13:38:28 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7IMU-0005bZ-1e
 for linux-arm-kernel@lists.infradead.org; Wed, 03 Feb 2021 13:38:27 +0000
Received: by mail-wm1-x331.google.com with SMTP id m2so5549112wmm.1
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 03 Feb 2021 05:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=ZqYuwkqJjFtx3+CqGJEsmGO2Y2Ix/J1mTtHiy7iPzno=;
 b=LUrGVScWzOjek/G8mjFIcU/PQmR0sTqeG1FdOuVLwn0CxwPYdzGH5tiai0BJv2fA45
 sAl0hrWVuAGZKW1nodkkYPT21UCbALW8PYcBDr6t5s2JoO3jnRKwlDYnoDRfQwqGhEOH
 UUXvK1a8RIxgTK+rZwib6VJVlq10QK/cPl13WYHwvbJL9UJDAe19LxtLE9tiYi1ZxU0a
 oQgL4OArqHgeUp6WXihTjYZE9COANmWI5ygvvh2+dubeW8XkiYMCgw2npnAb3i6fOmlU
 Vf0mcE6wfKPDYfMMEH8U5qc1TV5D9rtsk7HccdYe5x010leSCv/gYqqyGjTygzqL79GV
 l1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=ZqYuwkqJjFtx3+CqGJEsmGO2Y2Ix/J1mTtHiy7iPzno=;
 b=EQlO3bzNyFC6k96tab1UwZMf3FTap2Wfr8+1mclfLATOLbCWN9DFNwiNp0PcEU++6b
 ILe9uxFOud6mybw4mytH/XSLhUMby8i8IarhnPgVkJkc73vT+A0AT9KSRUTpSo+68adY
 YN9BWam0LUL4ItQNAtOIQCjdFNVzF/YFi997u/PfK+HDGZMa43IE5RlP1JlhTw0YfVi4
 Uyg118wKkTzVkDBGu/RsOdY1eP2+266AL3q+B80j75e/uJunWvdfXgE28Xtkf1UG/lTO
 xS4tksWsgtJGch4bi+UMUcZSUHM/AYWF4pOIQXwD49QDUB7KgmhLJb+pzjycU6CmsRFP
 omBg==
X-Gm-Message-State: AOAM530TQ0f4krpg5ivGVqlPa1TAsvZOh4D0A03vyEXqW9b5qRmi9VQu
 4sAfzblyHG464d9NBTmECbFaSptbuNHTGboF
X-Google-Smtp-Source: ABdhPJynepeIiN04s+kkCOGrg0gXSdHq56arbfmCEHngSCuUiGZy4WzrjkL8QjuRrxYX7oZ4cAiaaQ==
X-Received: by 2002:a1c:7e0c:: with SMTP id z12mr2958641wmc.85.1612359501908; 
 Wed, 03 Feb 2021 05:38:21 -0800 (PST)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
 by smtp.gmail.com with ESMTPSA id q19sm2929581wmj.23.2021.02.03.05.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 05:38:21 -0800 (PST)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
From: Michal Simek <monstr@monstr.eu>
Subject: arm64: soc: ZynqMP changes for v5.12
Message-ID: <2b0f6314-13ba-375a-9231-925b0a07be82@monstr.eu>
Date: Wed, 3 Feb 2021 14:38:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_083826_223525_127F9496 
X-CRM114-Status: GOOD (  13.55  )
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
Message-ID: <20210203133820.Fld5Rj2xxDTHBQ_hNp9COrr0jhTUjpf8WH0HojHWqQM@z>

Hi,

please pull this simple defconfig change to your repo. Maybe it
shouldn't be labeled as soc change that's why please let me know if you
need me to change it.

Thanks,
Michal

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-v5.12

for you to fetch changes up to 75e9e9764c2aaaa125944b47490893300336b8b3:

  arm64: defconfig: enable clock driver for ZynqMP platforms (2021-01-07
10:44:57 +0100)

----------------------------------------------------------------
arm64: soc: ZynqMP SoC changes for v5.12

- Enable clock driver for ZynqMP in defconfig

----------------------------------------------------------------
Quanyang Wang (1):
      arm64: defconfig: enable clock driver for ZynqMP platforms

 arch/arm64/configs/defconfig | 1 +
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
