Return-Path: <SRS0=gFkl=LE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D12C48BDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jun 2021 19:51:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDD4C61407
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jun 2021 19:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDD4C61407
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=le29MpYjrOZQ6QWxibDuoWew9jhgbKWMMLAic+bVKl8=; b=XacYPiK4I6OouK
	sobaljNj6RkpK6bI6WvciVgAlUN/6iIOHi5i5/CgfsmpT2Pl5rYEg3jtxrGKIHhj9aUzs6jG/OaqI
	CiwwScuQsrMpFhUzGw295MMX7X7qLBpaN/iOcBdF23g7kP8v1e+nzq5PK/qb1RI0nxxqnyH69a61w
	CfVcZJyiZYhioQ7KmjemF5EtRbG87x68c0wyLWPMXSV/Da8xNf/DEZyhSjybObiIqyShXRNOo8wVg
	7Vuzt/zFIDHI+F9srDWrC71ySlmZjlZ5cpjZqmMgF4K3a5YOe04iZqIIdtzqPBC4PvkUN2uwOqfPT
	HISOpetyH79pHPUQlGzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrQgg-002Gte-Cm; Thu, 10 Jun 2021 19:49:58 +0000
Received: from mail-pg1-f175.google.com ([209.85.215.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrQgR-002GqZ-O3
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Jun 2021 19:49:45 +0000
Received: by mail-pg1-f175.google.com with SMTP id o9so611290pgd.2
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 10 Jun 2021 12:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iXDY5en0aj/GRwV5MqPL/tJ51DVClCLsJNEI9eOFIb0=;
 b=SakiHlE2WD/E1EnCjqsGOhPTdX/XgZSKaFf3oPyeGHCpqHo1insKWsndI81YFK14su
 kVd0OL+KX1AbyWpBHQmTQ/QVwQRFU1fOQLvUDzqbweCAXMZP0AjFpai7L8nuql0KJdDW
 8Dug4n2xbx5Fy6UtJjt2YEajrH4uiVBBOLqhtiCdxz8Ua0k8PDDlrc2slrtv+zgMv6tQ
 KwlBH1aFvDNEePb2I25cOtaW6AxwjoJkncsnd6y6sDkm9xDTJkOEW+iMDQ3i8ojJgqZ8
 VDRiDLgfoc8yoroMXTBLqbyy+AXBMXNkdaAjSRkKebwthCfzWAA3VZ5/FDCd0TuKvu5a
 DPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iXDY5en0aj/GRwV5MqPL/tJ51DVClCLsJNEI9eOFIb0=;
 b=cwy0n+3YWL9AACbvm6MKMdcQ/jVfv/QkqE7d/tL4SERyIZw9aRBBKDjP2X18uosqTg
 Eg6irqnWq9o3sdIQ36gmeW6jxLcTkMigxuTN3mia7gXNlDuI/usafSed1w8kELnrX8q7
 4QCPGhiLKrrmaZcmpvKzfKUaZst3ZjeKyV1WmXSwWekE8PAlpIE0y4oeH2qh5htMmOLD
 XSnImFGi834jaJTgQt2a/tL7h2j87PVBdEq4HpcbfoGQulhUzG936HpBSzSFcuIO5DSq
 t0E8hqaoVwqPoYxtmiyDAwkp0l4Ysw7Xa2/o9++JMZ7j/LIl0F9oacp6A6jsgOyB9RUK
 uG/w==
X-Gm-Message-State: AOAM532ProrDeKI4BlC2YUE5zVA2BVCI9HcEU4cZGhHofuJPlZKke2Ir
 F0rusvGEO65vlS4yFQNcsFQ=
X-Google-Smtp-Source: ABdhPJwhpAAjlnuovQRj027/rv1KPncoE/EtqCDegGM5xB+3HbiqHuhkfqdHLPJpX9nvE/7h7uzntw==
X-Received: by 2002:a65:5bc6:: with SMTP id o6mr60630pgr.364.1623354523118;
 Thu, 10 Jun 2021 12:48:43 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id oc10sm3118297pjb.44.2021.06.10.12.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 12:48:42 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 linux-arm-kernel@lists.infradead.org, arnd@arndb.de, olof@lixom.net,
 khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 3/3] Broadcom drivers changes for 5.14
Date: Thu, 10 Jun 2021 12:48:36 -0700
Message-ID: <20210610194836.309869-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610194836.309869-1-f.fainelli@gmail.com>
References: <20210610194836.309869-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_124943_801356_B4408834 
X-CRM114-Status: UNSURE (   8.65  )
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
Message-ID: <20210610194836.H4Fl7ZjAt-Dc7y7o-tqIv3_b4ppBWguR-Ej7jf7Z_9E@z>

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.14/drivers

for you to fetch changes up to c1f512182c54dc87efd2f7ac19f16a49ff8bb19e:

  soc: bcm: brcmstb: remove unused variable 'brcmstb_machine_match' (2021-05-10 14:50:36 -0700)

----------------------------------------------------------------
This pull request contains Broadcom SoCs drivers changes for 5.14,
please pull the following:

- Jiapeng removes an unused variable in the Broadcom STB BIU driver
  causing an unused warning.

----------------------------------------------------------------
Jiapeng Chong (1):
      soc: bcm: brcmstb: remove unused variable 'brcmstb_machine_match'

 drivers/soc/bcm/brcmstb/common.c | 5 -----
 1 file changed, 5 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
