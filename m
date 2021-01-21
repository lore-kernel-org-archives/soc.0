Return-Path: <SRS0=2LUn=GY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3661C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 20:34:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 485FA23A5A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 20:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 485FA23A5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AFcVf9vVsrzZm9jK79Q/SUSAkOABO977QwSBoL319ow=; b=N8KcAYGQ3YT5hcX9mVAhg4Wvo
	KXJYILsQMsiWn/P3ojUt12H443NRaU3QhTZpC7UeqeXnqPRNcxU0OFVWYE2kgrK6FGIyqK17vjOWp
	ghFub5U6HX/msxBPsRGYs2Vqa/uYj4a6GhuGXEXTxfb7D+7dK38RTczq34jVuhXf8YpqAHkLRn0QD
	F3yvmfZhjTZEHw6o0AgNONDqsXYfdaupbhU3DVuJbv6l1f+HMg/svQ88VUzWk5zLs53ECsktmHnyL
	OD0F+2zmxrrobeyaeXQ21QuDbaxwkJ0NqMuw79l4qaQF10KBhiOGdaFx5HxYehp0uTY9XcSwWgWrs
	ZpUt8XfHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2gdq-00051A-Ly; Thu, 21 Jan 2021 20:33:18 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2gdi-0004zz-6W
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Jan 2021 20:33:10 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d4so1956736plh.5
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 21 Jan 2021 12:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y0S3quATANmRYZMvtPwUreObi+9qpRrv12aNAKhmXgc=;
 b=UP4iYk4fOv7kU+ktBFUVpsdoQXKlUfZWjPscDYF/D+cPiJeX2KMZuVkJPN44CQeCXb
 0uHZy5y1cMJaNqtcdRdU2+TYfxPVyv44pFnlzpy+c8RzO9ezt0pV7NOxfUl5y5eG90fs
 QwN87/Y0G+FWE5pYzo0Zso/GNu9epyliFeRtn+zDFWN1P7VpSPwKbwGgh/E7pGvswfo3
 iZiXy9YZEiW/U1fRq0IA8QoN6kyDvm0g7be1ilJZq2E3YLAriCkZ4T/2eqba9F3W6+a8
 sHImmXaTbx5R4gtyGYrwAh3ozxkl/3lpqR/Mo2+M0jJLXFKjaZOX76TC4imlEO1ch6YP
 wA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y0S3quATANmRYZMvtPwUreObi+9qpRrv12aNAKhmXgc=;
 b=aBw+yWGgHWn1UhZeyiMDOPS6QIAN1i+NAB5+twEHETUftJZGGqolvnSsxiM8+4/LjB
 hhrn9KSr2aWwzlonit/JE2Gcs1nvNZIoXsAIYs/Q7hM73dp3OPGx5F0JejxJkyeFI8K1
 w4FWlDlCpzGqADppvmOhFjf753SRxkbDHenUAvCXDWnlvEwwgjvZxxoJNboYxhyZ5jcN
 DSkqbf0j583KddE+luag05bmlhH7vvqC7rY+cECGBL7eh7CyfWRF5uyvzvgt9yoVb8Ej
 qO/cY0To2Kc5JDEsavB+JmeUfgO6JyMJ6YWf2Op0MwDVuH4blU9Q0dRe7e19Xaf6NFE9
 GK1w==
X-Gm-Message-State: AOAM5317LcciL8H/AIriLYtKS1G1+dKyvPN6r37LDvxmsWYw8NL9fWit
 zhsy1mU0YUikKsn8l1wExP0=
X-Google-Smtp-Source: ABdhPJzutSKQ2vtpPJ5XAdjkPlu9B10J58bPcDegHVqAr75XSqRHC6X5WbN5T2o4xWE2AP6M2nNxYw==
X-Received: by 2002:a17:902:9a02:b029:dc:3481:3ff1 with SMTP id
 v2-20020a1709029a02b02900dc34813ff1mr1463045plp.28.1611261188031; 
 Thu, 21 Jan 2021 12:33:08 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id q12sm6305667pgj.24.2021.01.21.12.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 12:33:07 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL 2/2] Broadcom maintainers fixes for 5.11
Date: Thu, 21 Jan 2021 12:33:01 -0800
Message-ID: <20210121203302.3639841-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210121203302.3639841-1-f.fainelli@gmail.com>
References: <20210121203302.3639841-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_153310_278342_3D026E3A 
X-CRM114-Status: GOOD (  11.00  )
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Florian Fainelli <f.fainelli@gmail.com>, arnd@arndb.de, khilman@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, olof@lixom.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210121203301.rXrYH2CWMmdigNCFWyh-co2ga6QOT3ro1sPRW_Fak74@z>

The following changes since commit 19c329f6808995b142b3966301f217c831e7cf31:

  Linux 5.11-rc4 (2021-01-17 16:37:05 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.11/maintainers-fixes

for you to fetch changes up to bb5ff8c28e296dd7101accfd3fed9475cac7e4bb:

  MAINTAINERS: Include bcm2835 subsequents into search (2021-01-20 10:47:20 -0800)

----------------------------------------------------------------
This pull request contains Broadcom SoCs MAINTAINERS file updates for
5.11, please pull the following:

- Stefan updates the BCM283x to also include the bcm2711 pattern to
  match files pertaining to the Raspberry Pi 4

----------------------------------------------------------------
Stefan Wahren (1):
      MAINTAINERS: Include bcm2835 subsequents into search

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
