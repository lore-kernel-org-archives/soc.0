Return-Path: <SRS0=CwTY=KG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED0F1C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 May 2021 19:02:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4570C61466
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 May 2021 19:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4570C61466
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w1grdUTcFMwcvmZRlJojCPj/VIEYuKLglYk9GwwyN/0=; b=b/E7bhAk1fMr1qHq0BgxyjYunF
	Tarouh4qR8YVbqsRiHozXSJBjlUgNy2Qe/rVIxhqjbIQl/N/Ptqj7lw/BQc4iRlfSS6afyvper21F
	6+qEE6knCv4azvSvGte4PjCKv6IYFGMoG66goTNqZugiI48q3ytTsJtsT+lUrLY5VqXCJrDB1peNq
	d9sRdsi5/zox5URk+3WkGPMt/H1LmRGLo99h5dHbfhCeERyUKLgBOzvMrG1TyIAS1ySxCfrotwzf2
	jJ1SDzFxzBcHvNozwMWBFptOPhwFt19Fiv1O+H9S9qLgMEYp8KRj3HFEAvLfjgxHEeS0yZ2NKk9B5
	pLwIFuzA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgXcy-0014gX-0L; Tue, 11 May 2021 19:01:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgXcs-0014fs-Le
 for linux-arm-kernel@desiato.infradead.org; Tue, 11 May 2021 19:01:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=1QNHHOT5/rxXgeedYeM4a2djt2oyHaG/EvVoGjfBbRg=; b=1HEdPYuT6co33totRrkpjNB0m8
 gj+eJtegJJ+QSudP6zaOVHQFXSNF5bRJrGEFp68/wJee2cfqC8ylSkfciGy9tVhqJgPzJRgf2A2yR
 WKjlmJrcJINAzsSiWIOPTDZD4uz2dvCzKeESb7m9yhQZ0vi4PI80PL9uw886QxNbyJtGxx8VoppZv
 WlsbkGFLIYZYr4t5+k7mRZwwZTN/rh4T76sAU4gDi152P5z2o4Fcei0zMgKWi5skZnttIfQPmkryO
 +iKD9lV6u7LZedGKy4HoHg3bnHhrGYPfcWCwyJIDxWWNSKsnrqhr0P1clbvyZDcRSdydEOHobBP3W
 3Ft0EbQA==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgXco-009rRP-Mn
 for linux-arm-kernel@lists.infradead.org; Tue, 11 May 2021 19:01:01 +0000
Received: by mail-pl1-x62f.google.com with SMTP id a11so11283449plh.3
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 11 May 2021 12:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1QNHHOT5/rxXgeedYeM4a2djt2oyHaG/EvVoGjfBbRg=;
 b=D3kd2aIiWfYa0HxlSPzNMFMD3VGm3LnEUf6eY+QgayueEVxDerAIkdgkipO8BqN5pC
 uffJ3xpxLMxd1UIdgb4e8TdhqV5jLiwVrLXS5YLWP2TrLrkeWreFYYMXXdqgwamzBWL8
 4nocSvHZNIGzTmudeIAgJ8KmhT13W5wRWMAnOkCC2Pmh/PhM5GabwejS9hMGILlHwtxJ
 vfNTlz7gHjlBbVE9SAP2UAka1LBDjPt8ZDuAPmvnQUAJ/Ta5a9mGxij1MRY7bFNKSA7y
 61nlQPA2MhZMUuRqrwN3PqYIViB0HBdTNnk1cYMWMmnWv4+snLtB7PQDdGN0aSon7x9G
 LD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1QNHHOT5/rxXgeedYeM4a2djt2oyHaG/EvVoGjfBbRg=;
 b=uQaXxKckOODiFTYxvhRqm4a106+K8UbhxhS5XaS+jyj2faQBaJWyhfXwxfVDr94bky
 +VfC4ZlNrehjHv83FUqOCzrfR+7shYqOJ0SyElkpRCbqGF5CR4tFkUWkRtoIEDyOeZxB
 uI+kDq8+Kgmk9kG/j00XyMg9TR1tLR3ElBDIt584Q/kkwQDj+2TY7HxkEnohxMIWeyHC
 Irvda4fucVZavPH8KLE+Xm/92T1FMRRnEuA+kRpoDaFNxTExgXm3v/Sw/HAr+wPCGhXW
 Kkp01jkLl39LWdgMqKLsRB8GBMqcE2jRrgdpY/oSpBnyFL+sMj9M7ooMwC/IkBNZZ3dp
 EQEw==
X-Gm-Message-State: AOAM53269YwhZ831KykR/2knX4hsPz1OXOuEjz68LyFMSFNogGgOg1vW
 vyEhh4ZORQWq61QV1epv6KxgPA==
X-Google-Smtp-Source: ABdhPJzpcayWkE4ql/OVzinUyg2mbTDgXAO7HnrWZLHKN/8hsfMISsWcximIO+6a+riDpVoMJcUaeA==
X-Received: by 2002:a17:902:d491:b029:ee:5aa3:7d57 with SMTP id
 c17-20020a170902d491b02900ee5aa37d57mr31433298plg.26.1620759655705; 
 Tue, 11 May 2021 12:00:55 -0700 (PDT)
Received: from localhost ([2601:602:9200:1465:da9d:67ff:fec6:ee6b])
 by smtp.gmail.com with ESMTPSA id p11sm14954494pjo.19.2021.05.11.12.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 12:00:55 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: ARM/Amlogic SoCs: add Neil as primary maintainer
Date: Tue, 11 May 2021 12:00:54 -0700
Message-ID: <20210511190054.26300-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_120058_748603_3BB41111 
X-CRM114-Status: GOOD (  12.77  )
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
Message-ID: <20210511190054.9SEUz4myI2Xy4wVfHcO5lk7NMNNtt2dqTVVoGeyjVjA@z>

Add Neil as primary maintainer for the Amlogic family of Arm SoCs.  I
will now act as co-maintainer.

Neil is already doing lots of the reviewing, testing and behind the
scenes support for users of the upstream kernel on these SoCs, so this
is just to formalize the current state of affairs.

Thanks Neil for all of your efforts, and keep up the great work!

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bd7aff0c120f..1f64aa7de84d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1618,8 +1618,8 @@ F:	Documentation/devicetree/bindings/sound/amlogic*
 F:	sound/soc/meson/
 
 ARM/Amlogic Meson SoC support
+M:	Neil Armstrong <narmstrong@baylibre.com>
 M:	Kevin Hilman <khilman@baylibre.com>
-R:	Neil Armstrong <narmstrong@baylibre.com>
 R:	Jerome Brunet <jbrunet@baylibre.com>
 R:	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.31.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
