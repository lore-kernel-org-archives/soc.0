Return-Path: <SRS0=Fj/g=HC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC347C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Jan 2021 22:19:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A69FD64E29
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Jan 2021 22:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A69FD64E29
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c1QecyIUsGUXV+scM4522myRr4T0X/Z92iGIrIFJMyQ=; b=jBQ3RVrAg4jHwiY+KMtdtFUCM
	91oWxHHEVgprclNB8Wum60heUnKVFzWEwIBxTN28VF7nqok5Y0z4CKAtk2KukH21Md6+9DeKivJbX
	94BWZDnJ7e0CCbCx3z+ATFASNjtJ6k26VmqYRO2HtPE/zVsvKYW/JewxSGJe587sJ0FGH+vwEW5Iv
	WhCGD+AkOmY2QzcZECbpQWnVM04NL4K6PL5RQ43JSEwxgSVAf8bpprRgk2Ueze28Fgex1HBAu08Zx
	d+mmnsq1KKo6hzaSGjhzebqrvh30PEpRET11GyFQW6bXJtzDj5v4/JJ6grIvDZ1rgjjISr4ejonEd
	VI/OEw6AQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6L3I-00011Z-21; Sun, 31 Jan 2021 22:18:40 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6L2s-0000xn-B7
 for linux-arm-kernel@lists.infradead.org; Sun, 31 Jan 2021 22:18:16 +0000
Received: by mail-pl1-x636.google.com with SMTP id h15so8892717pli.8
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 31 Jan 2021 14:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cy7H6RjOSWJaQHgQqPSzs728mDlUm0icPLVytrCrESM=;
 b=ndmxwi/zgkeF4HS+QACbI92MwWTq6HQTwYp6B+ZrzxdIzkS7+ujD/IoYVh3mYFbWxP
 HikBY0QoIKdDs6I3d4zUg/Rc7gT6HgRkiOm26foVgF+zU7fdxaP8bLXfnobSlGjYSdZL
 Al6ZYfbc1OEzmf91mv1+knf8sNwVCGnLEJx2wyNEA/QJXdNPc2QSSlkA5y7PMLdUpSje
 dV8sUQokvTtRaVcyNjcudghsV4bmtU4PU50lK4+2F/ERuGZgnffoM6YToHpeUE9N/+xe
 KwFpOClOyOauW5+G+gLLIRssSBNjH+cgORMl0ch9I1Ry05EPEYxJFTzjCFzz9J4rrubz
 AQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cy7H6RjOSWJaQHgQqPSzs728mDlUm0icPLVytrCrESM=;
 b=ieKbjclqKffitnnE741KvlYgAniu1safWVdpHyn4e9jnmxKOU/604B4AfsmGIrSaGa
 dygxmm7FMLOrGmtklTWGjgRcXOn9Qa2bJH+Zu7qagEEvF1YGo329DHF8nanL3/HenjzA
 HvWRUR1r6YpkevQdJxlgUMwJB3qMYRA0RX9iPv+ZB67ZXShKmU4tFGaj+obck6SLRd+7
 Shc1wfOD+IbNwUq/UyyKOMBVRtcbkn4jghbA0E0ZYaV7F/z96rcD9dBRwxXNEm46e4sJ
 NuQOFIzQg0X1kMGq81OVf9Jq0OT/AyRfq6YrG27VJ+qk4XkBLjepp+doMg+YlaUOSGTB
 uuyw==
X-Gm-Message-State: AOAM531Z8nsPPWistvEcD8HCeE+4FVce7gijUF0HtKRhPwWiZiK/saGC
 ZCNdjYSH8X+p0y7I1J8fHzc=
X-Google-Smtp-Source: ABdhPJy6upU/bZBOa4WobjbR1Z2RXkAusy3PH7J/EPW6l45rMgoymOR4RgCl7EjRSPZ6LGr3KV0eeg==
X-Received: by 2002:a17:902:7445:b029:e1:5a7b:3f15 with SMTP id
 e5-20020a1709027445b02900e15a7b3f15mr2586609plt.29.1612131492227; 
 Sun, 31 Jan 2021 14:18:12 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id a4sm15512177pfg.41.2021.01.31.14.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 14:18:11 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL 7/7] Broadcom soc changes for 5.12
Date: Sun, 31 Jan 2021 14:17:21 -0800
Message-ID: <20210131221721.685974-7-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210131221721.685974-1-f.fainelli@gmail.com>
References: <20210131221721.685974-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_171814_495990_BDFD7F71 
X-CRM114-Status: GOOD (  10.41  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, arnd@arndb.de, khilman@kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 bcm-kernel-feedback-list@broadcom.com, Maxime Ripard <maxime@cerno.tech>,
 olof@lixom.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210131221721.xa_O4FuuxC0Vb0kWc_QgCFN2GKQ1BwMUNWw8t8lNuQ4@z>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/soc

for you to fetch changes up to e066cfd867aabe621be5c1855fc42ff699781ae4:

  Merge tag 'tags/bcm2835-soc-next-2021-01-25' into soc/next (2021-01-25 13:14:49 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Kconfig/machine entry
changes for 5.12, please pull the following:

- Maxime adds a select of the Broadcom STB standard L2 interrupt
  controller driver which is used in the Raspberry Pi 4 HDMI controller to
  support I2C and CEC interrupts

- Florian adds a debug URT entry for the 72116 STB SoC

----------------------------------------------------------------
Florian Fainelli (2):
      ARM: brcmstb: Add debug UART entry for 72116
      Merge tag 'tags/bcm2835-soc-next-2021-01-25' into soc/next

Maxime Ripard (1):
      ARM: bcm: Select BRCMSTB_L2_IRQ for bcm2835

 arch/arm/include/debug/brcmstb.S | 30 ++++++++++++++++--------------
 arch/arm/mach-bcm/Kconfig        |  1 +
 arch/arm64/Kconfig.platforms     |  1 +
 3 files changed, 18 insertions(+), 14 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
