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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD508C433E9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Jan 2021 22:19:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4E8B64E27
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Jan 2021 22:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4E8B64E27
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b2evzYOAvxvL+QTfAGjV8KCS88wjIcZUNPVtKfylw2U=; b=2NfJdD9+Nil3iFNUD6tAuovz7
	Gm8LBHeJJvf/4+0yyDskzrTn5KSm3OGVJ5K6ks5OOWch7YguwFbSuPxBlsIPnUYN5VszYyMOTAN2P
	xe8DXjDkd08Hyq/xyd8yG817gqze76Vm6JFqgMD74xgs+E+cw7asBmJNm4I0ne6WsjMPWprT02tQq
	OiZ2yHLCB5X5z/0n0JTcFzRHhXg1e8rnmhydHlDiq2jpf90aYiZgNJZM/Vmj6AznAwfbBAJLGGIbs
	WOTYUbsQkUY6Nv/bCvHblKc0JK2J3VlIQoonqM7icDOUR2N//OeHzdMmNHA9JCAgN2WMUlD0aCa1C
	vZSwrZceA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6L2q-0000xa-A1; Sun, 31 Jan 2021 22:18:12 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6L2l-0000vm-0z
 for linux-arm-kernel@lists.infradead.org; Sun, 31 Jan 2021 22:18:08 +0000
Received: by mail-pj1-x1031.google.com with SMTP id lw17so8612698pjb.0
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 31 Jan 2021 14:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GxP5t3b+YNXM1X9AmYS44ePdp54sRc1ZJCt20CWFnoE=;
 b=kbBfhAg0cG5jGnYauCwONevUdexENKt9E+Xfgm1jrzNvnOv7wGGoExQGrKumXzmUi/
 8cHxiISpUa8iK97/dJhQIrWt+URNpm2WYC3Ymq6+JhOEOIT3tQoaK7VtNQ+1Cv2OEnCJ
 NuTDSrbnDX6/oXnQUUZvojmEFpp39AEDtRbucpsO2JFr5UJPPj9557sDzG6EHfD/SmXq
 bxMOefhAsl2tMdiALKpmN2uJ4lwIMM5350Y6ZtS16Qi/IlzV6rhTvRJC4YEJZyVZ7F8m
 diSN3+2t7WvssuoYXmE+xJw5T3Rnlgyw2EDAmuvuJ9I2xFgixWE+jhNFDLE31ZU5oukN
 REBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GxP5t3b+YNXM1X9AmYS44ePdp54sRc1ZJCt20CWFnoE=;
 b=bB5eskAkZ4N3CphDIBDkLPJUVSmwUNWFOM/wD9EUlvNDYjR5PGZImSrA0RBdb689XL
 7SxfHJCk2r5D5RrSNU4cKIoo9xQ4PLKbI5osaSNE9mGnbcLMXaDQDOaz0JcIPdhnVvcZ
 KpPkuR8B1PPsERaJ75nnIlLRompbcJDnDNVTSBcWdJsv+9rB8m/LeEAdeh/eW8ePC6wc
 FWFKw6EcA6fKF2r9I+p11lWNS7TUha8NT+chP9R4f8wa5L99BsCOYR0mdiQX6QkCFOqb
 QiSTojsZCDX1+ujyXdiI4gs3bvkLmlUQdr49asUqiGu3KQMTl//dmbBsGbeERKxtvHcy
 40sw==
X-Gm-Message-State: AOAM530sn8wJPKv8rlaoGBC/Ji1kEuxOteW5TVRmtyl6jWtVq2pa2BG/
 lBK2/8SS7DayfSvbI0kBV6g=
X-Google-Smtp-Source: ABdhPJxn8w85QngvjJ+dWCBDUkYd9RupcqtYT3BkPVe9TG6OMaOP2QEHyBtjabcqWRsBJaX9p+2XqA==
X-Received: by 2002:a17:902:eccb:b029:de:8483:505d with SMTP id
 a11-20020a170902eccbb02900de8483505dmr15410879plh.63.1612131484568; 
 Sun, 31 Jan 2021 14:18:04 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id a4sm15512177pfg.41.2021.01.31.14.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 14:18:03 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL 2/6] Broadcom defconfig-arm64 changes for 5.12
Date: Sun, 31 Jan 2021 14:17:16 -0800
Message-ID: <20210131221721.685974-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210131221721.685974-1-f.fainelli@gmail.com>
References: <20210131221721.685974-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_171807_102206_0EF9D248 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, olof@lixom.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210131221716.oj1iQCZtbBDc75f792yAVLqHtesy7e-j285-Q-zeHxw@z>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/defconfig-arm64

for you to fetch changes up to 2a9e89e6a694cb01ff19b8ffd6fceb46b824f1a9:

  Merge tag 'tags/bcm2835-defconfig-arm64-next-2021-01-25' into defconfig-arm64/next (2021-01-25 13:14:13 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs defconfig updates for
5.12, please pull the following:

- Nicolas enables the NVMEM reserved memory driver to permit reading the
  Raspberry Pi's bootloader configuration from user-space

----------------------------------------------------------------
Florian Fainelli (1):
      Merge tag 'tags/bcm2835-defconfig-arm64-next-2021-01-25' into defconfig-arm64/next

Nicolas Saenz Julienne (1):
      arm64: defconfig: Enable nvmem's rmem driver

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
