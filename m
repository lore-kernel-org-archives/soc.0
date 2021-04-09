Return-Path: <SRS0=+Itf=JG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FE7C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 17:52:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6957A60FE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 17:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6957A60FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dG7QdD7ZDkiStF1znJpQKokry0VG1tlh/6oLnHeQtls=; b=THrZdLvgZqSxn5Fgxy4lj5jKXS
	2p+CVieixEzQRTlKsyO4JjVVCwJx1KwD4thRS4RT+Uzv8w3LqBEVaBEx8LCCoQ2eomDgGNK3mQGW5
	aNtJRMRUx221V5aBS/loN/jYU56I54BJwtvXqx751qTxAyHGXmLEizOCovbhT8Wkie1y4KEiCK0aP
	69AeA8oP+0HR2aUKIEaJ95f1veTv5m7kc3n7dvDFZk5iuzlMOANcowCDlD/NROpuioMq+IVnvh2Bb
	6xU6ehFfGRjvy+qdJo6m4My/EF0mSc/qrUxwoyRSUkD6Hdo9yRX4iC+WBwWiknoDZgpX4y6lLAs9K
	SP8wqyJQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUvH2-001E5V-VJ; Fri, 09 Apr 2021 17:50:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUvGz-001E5I-Rn
 for linux-arm-kernel@desiato.infradead.org; Fri, 09 Apr 2021 17:50:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=yF4adJ/N2MJB/B2dgo3LBF/vMMqYbS0nkm1kg+A3XuM=; b=0zG8czrJjxm0V0jj7KjFY6G9MV
 KtqPEE7ABIlS4fTfK7rise/IMTk5V9vcva4MqVXmk6z1rYqEfoJpqll8y/r4Bt4KLwCGKQDbFxN6n
 EKVviTb985EyCyozzR0XZsRecparv5kuCJ0nuak3g9EffbjOoyxa6vKrKXf9OGnWL22tMXDbuO5bU
 av4r7ZoBjl8YURzlXyCHMInOse93zBrYNLsauAAQrpTSjRiz/RX/5cPZoCDiTJNubSjC0WcBSFWfq
 /VdELJSMLiiGJMFWSMuEY6mDZH9KAbTpuUnwN/X07f6Io7s1BGP9bIDhiCc94INIVmBG78CO8YgF7
 lF+0kiXQ==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUvGx-004hbk-7B
 for linux-arm-kernel@lists.infradead.org; Fri, 09 Apr 2021 17:50:24 +0000
Received: by mail-pf1-x42c.google.com with SMTP id n38so4738152pfv.2
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 09 Apr 2021 10:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yF4adJ/N2MJB/B2dgo3LBF/vMMqYbS0nkm1kg+A3XuM=;
 b=D6kKemq6EnpKrfWIvgpsEpTT028RfRz8+6DpFobJX56oYxynu6JztyCv21GKK9cZwp
 zWR7dKvJ+HkzBlB7FPw12mbiwdbPyRv/mYwrU0oymndu4ideXQBIlgQg5BcFAO1khr0z
 SCk/SsOggGhGTsXlAjF46q5n8J7EKG4NU6Ujs0APlhJwQ3Hjr+BfYKNtm5U1iy1V39Tq
 7bIzkkeN3T4RgINNe7h767S/MmCeMvDCU22jFdReisRbQdunslojnlCwuT7qtCz1q32J
 Wx1aw0XDSmb9U/PhiwYUcc92L8DRP5qOpq6gXbYjfMYYOAwzYuHv9IIrnr0blo0y6vMv
 FyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yF4adJ/N2MJB/B2dgo3LBF/vMMqYbS0nkm1kg+A3XuM=;
 b=al/P/NdyA/cdAyrdBNhksyFAX+4+JzQqO6fLg1pyGC4eMehsfuVHIBuKu/CiJ67AB+
 KlIsSePEnbGDtvee3IlrvGG9ny1fkPgK6yoBUloAvhDmxFrZ1ojgsVnneGvW1ozdFL3s
 tyV4Z8lUvqs7+au9fIzBq93kIx5PnCzV2EnvPHfd10A4yu/eOYXzcw1jqZ/HJIIDMUib
 DYjPl4MehbAz9Q4fmrJN+3vO8fNW6z1+V2dwQF+ix4a6SGjBO0qcRsIBbkclyhl4fscN
 GsHAXS1Mvyy/A1XfcbdwWBVOMOcDMVs8z7xbUGb1g1ARqI2yCA5Sm2P6r5HyiA46YbDd
 BKCg==
X-Gm-Message-State: AOAM531mEroqvyZYBOtjh3IRkJfxwrJqbka20Di0BNi0dIMmgc0/WzaE
 WFui/Dx4q6xMo9r9Hm16FNZXe7wtADk=
X-Google-Smtp-Source: ABdhPJxHp+9xc6/QzyQflTULgUDZZGa7gN4SxfnVzrVYepgzPZ9jzUjK7LdxsCV2el2gWwpUEvezVg==
X-Received: by 2002:a63:eb49:: with SMTP id b9mr14099271pgk.318.1617990621940; 
 Fri, 09 Apr 2021 10:50:21 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id v126sm2878493pfv.138.2021.04.09.10.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 10:50:21 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 linux-arm-kernel@lists.infradead.org, arnd@arndb.de, olof@lixom.net,
 khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL] Broadcom maintainers changes for 5.13
Date: Fri,  9 Apr 2021 10:50:18 -0700
Message-ID: <20210409175018.3051283-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_105023_276465_167EF94C 
X-CRM114-Status: UNSURE (   8.14  )
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
Message-ID: <20210409175018.9IYAUXmXXG0UTB80KRLgTTcYhvksnmS1g-ug9wMlyoA@z>

The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:

  Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.13/maintainers

for you to fetch changes up to 0072f6c37f02071821eb2135b80daa404d783704:

  mailmap: Update email address for Nicolas Saenz (2021-04-09 10:47:17 -0700)

----------------------------------------------------------------
This pull request contains Broadcom SoC MAINTAINERS file entries and
.mailmap updates for 5.13, please pull the following:

- Nicolas updates his maintainer email to a kernel.org address for
  continuity

----------------------------------------------------------------
Nicolas Saenz Julienne (2):
      MAINTAINERS: Update BCM2711/BCM2335 maintainer's mail
      mailmap: Update email address for Nicolas Saenz

 .mailmap    | 2 ++
 MAINTAINERS | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
