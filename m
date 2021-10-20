Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D61C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 16:31:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73EFC61260
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 16:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 73EFC61260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xw5X8MO38MiEV7GL7/3yx6eWQtts63aMHXxzRyl91s4=; b=tBSFbF4trVj8hx
	9r6RvvDxn2kLWOtVci0u/5AaEbjJQU5xSBpGjsJuCL1a9m/zeS5pE2lp6lqXbKvC5rtKjupkO0mJY
	AkPkx35jckXJmP8ADHiuffWfvi2KC04smLE6VSBncOj8g+KvoDlAKWhRLZNnKjps1hUw0rPjgF7yu
	ZAhMA3CAVdaEXRq7npyWG2GR4EZC2uIZ3SNhDONDadQIAASl+bn1EVMT/5i4Q2cXQTB99a7VYLtRi
	OexlEA8fnKO8EXKNFZY5kHai9iXO4pSurK5G06P7RLCM/q8fy1ahH+XEBnCLlE92bn89GSxO+wcb4
	yPboQQQFwhJJACYgFoiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdEU0-005F87-Ms; Wed, 20 Oct 2021 16:30:28 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdETo-005F6z-V4
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 16:30:18 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 b15-20020a1c800f000000b0030d60716239so3091772wmd.4
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 20 Oct 2021 09:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6XjNUCU584GTOF4zet3x8OCHbU1oMVSJN8YC6vpFGz4=;
 b=bZKBwte2qSshvK2+C2XZIwJ1WsU8pZ2r1PO6PLG5plZi3jUfxXYHSk5ygMJDdCmIhg
 /WEHNRLWMBU4QL7JmoBt293d0I1GUcPkicdNdqDr1HXHUNvQvHLFBNr/46XfgAUtrMIl
 pw2Jz7hlvA8GmQKGGDQTxOHWvLT4bXTNGJmKCFYlammkerw2nmEk62qF1/o584lHJ7ag
 9gDL3DsEhlW2aYRdy+fXodqmM9kYGLEL9gaoLVrl/+RslaobvhQ2z3MAa9K4ihWs43gc
 +Qj8JBhFZoQ1k+98EEd1docGaRmgem3+8rh//lPX2utT21Six9PNzhHf0FHCGQ2zq6tg
 OVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6XjNUCU584GTOF4zet3x8OCHbU1oMVSJN8YC6vpFGz4=;
 b=leD13Chc19l/2PKVxx09cdqH8P7xr4a0602pDbqApVSlK1T/Fis6sqCSEqoAOP7khA
 fw+aDO3SGIrZ3SoernxIogmpi7ZBvA8kvrGVldWcRfiR0gc1oXov2BrWHzdje5bi2l5K
 NJRn10/DjqZ3VU34KqeJYfgzGRMzdHMKLlBEx0AieyVXVWEdGkmd/5DvHzmZhlLgIXHM
 RYCV1/g+ItKujaqmiQ+N74/IdmvmvjwSwwId+ZUAuwqguuCAlhBs64WivG/RKgx0cUmk
 ky8oy+j2dl0GzmNI/QdLurxypJ9SFU72IWVCklqiUqcGFCqPbkfyTJZHosahqBqaLqBI
 wKsg==
X-Gm-Message-State: AOAM530YrZfNTYJez9sReyRmz8R+eec81dm+akTYXeA1qbsCe+I/ZF3j
 2dg4F9MiZO16Eywg9b47L14=
X-Google-Smtp-Source: ABdhPJwEa/F3q6KA93Qz30hCAnZCFTLTY0F/LvLTFg3ChJTyaT10uzY2LDoJjde8kLVM3oJWvHINHg==
X-Received: by 2002:a7b:cb92:: with SMTP id m18mr1772874wmi.15.1634747415181; 
 Wed, 20 Oct 2021 09:30:15 -0700 (PDT)
Received: from debby ([2a01:e0a:a6d:a8d0:7ff4:8f61:5574:9f95])
 by smtp.gmail.com with ESMTPSA id f15sm2390843wrt.38.2021.10.20.09.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 09:30:14 -0700 (PDT)
From: Romain Perier <romain.perier@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Daniel Palmer <daniel@0x0f.com>,
 Romain Perier <romain.perier@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [GIT PULL] ARM: dts: mstar: updates for v5.16 v2
Date: Wed, 20 Oct 2021 18:30:10 +0200
Message-ID: <20211020163010.3079-1-romain.perier@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_093017_016653_7CC5764D 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20211020163010._7wV2T52fvpAsmHBVWM-gRu8VjsMB8gD4opsN-bYSJQ@z>

Hi,
Here's the ARM DTS changes for v5.16:
 - mstar-v7: Mark the arch timer as not being initialized by the firmware
   and rely on the physical timers.
 - mstar-v7: enable rtc

Regards,
Romain

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://github.com/linux-chenxing/linux.git mstar-dt-next

for you to fetch changes up to 4ad12dd5a2b05406473dc33bdf7dc6fd79024ca6:

  ARM: dts: mstar: Mark timer with arm,cpu-registers-not-fw-configured (2021-10-20 16:47:30 +0200)

----------------------------------------------------------------
Romain Perier (2):
      ARM: dts: mstar: Add rtc device node
      ARM: dts: mstar: Mark timer with arm,cpu-registers-not-fw-configured

 arch/arm/boot/dts/mstar-v7.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
