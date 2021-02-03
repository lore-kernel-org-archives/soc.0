Return-Path: <SRS0=mi7Q=HF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B6CC433DB
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Feb 2021 19:23:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3632464F72
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Feb 2021 19:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3632464F72
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lq/Ql5Odk3m+bYdSeZVwnCCNWG5N8bCQdOjLkJskavk=; b=2TQo2ZYgOwzG9IXGPkyxF9R2/+
	1e7PXuoyVkplRbQinpNv/yEyzURysrFvaDMR93EOaNDE0bu2/cCP9toW6BrXre0EiP+fjOwr0D0Ff
	YXJes4kxWL24yp4Gr1QJBYU3exb/3rOvF0WaJd7A0UsRMIFdi7npqKVb1Q3vGEH2eU4Qh1C5XE1pl
	EODQFJV2HbaL9WgdqynSV7E14Dd6Ee6GxEX1TPEPgbbHt/KpykrM4L/hIioEecP9uaCmp2EC2Yfjx
	pfYWrScQowKtmXcl6EhsfEUhxtAFx2dPJAyfs+fKqOGURyS6YKqjRDO1l6yDGNPm2dVGw9bu4H6LR
	YlXhZxNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7NkC-0000YP-9t; Wed, 03 Feb 2021 19:23:16 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Nk8-0000XJ-6p
 for linux-amlogic@lists.infradead.org; Wed, 03 Feb 2021 19:23:13 +0000
Received: by mail-wr1-x42e.google.com with SMTP id p15so532826wrq.8
 for <linux-amlogic@lists.infradead.org>; Wed, 03 Feb 2021 11:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=onBVJg9xOta+3KOEfaOsQ3ooUKVCCIVzUkC7fGZngcQ=;
 b=HBGLNOUeNlzI8kk7BD92SpiFMSzTgzwAx42/MoLFrQ0PqymRq1xIrkPdR9g0mk4+Yk
 OZR8VGQVoHn5v/VaLzJGxuxCRV9Cxvwiz4luEQnaOyitVwNLYcqPSdz7Lp1xEge6+BKm
 7/wO4Da6JM+xS203aqdr7HC/JyrqAcGQusyTnAJTJZEbRwiVKjKrznB48rjXcKQzzwRo
 CRpkbgXEMhfvZaeCcZ5OskXXF62HGGMQ0us3vmZ9SF8qFrviOhtcqTETbHVdNq1tEve7
 gfVoStGlzVIv/L/7e8SKGogy0mwNNQxTbGHZvQ7XDRdxuBZatEFMQpZvEF+lJPM+2teo
 bkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=onBVJg9xOta+3KOEfaOsQ3ooUKVCCIVzUkC7fGZngcQ=;
 b=mfK1GqYpI0fDjpyJgHZXkXB2Vo3Rmy1vhDTyxkd1fBODHOl4R8KmR5sLuPTkcBW5pX
 eJ+FdL5LMv8/r45oozNf0IZaLYUBhXSWMsBn+vZkDLUr1h1rZOjq1Xb4lCNoELHRVioU
 NAAoyRSnCQpxYBELOi/YbiS4HPbFIEbkT4BBqDWgb8Y6RhjqmdJA6XOV6S1mhjKxrib5
 1Uf7ekwunAMZG4NiqzKJ8tvtgGrprxj4dRZ8ABH9ZZo5I+pAqp3OY8v3P088+TRgLhu+
 rWOH7I/CgCIGKieNcIHXwIPmvu2k5s6xG0PgH/pAHV/PMjdkL7T5ZDA65o7uCzg1JLCi
 T9ZA==
X-Gm-Message-State: AOAM530aafN22HOc4Kc5wraqQN0IXz37TmmXP5eb6K/Ir1zq8tSiDmQh
 RE5uTf232dOfsQSu8+Xb3JQX9A==
X-Google-Smtp-Source: ABdhPJy8CGtZ16/mDr+58wE3ZKP2To71/ZtPrB1m22ndaDhNJ2TQOozN1O8erSAT3BcNYBrgA6eCyg==
X-Received: by 2002:a5d:6884:: with SMTP id h4mr5421879wru.106.1612380190918; 
 Wed, 03 Feb 2021 11:23:10 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id o124sm3920806wmb.5.2021.02.03.11.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:23:09 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] ARM: multi_v7_defconfig: amlogic updtes for v5.12
Date: Wed, 03 Feb 2021 11:23:07 -0800
Message-ID: <7hsg6d2bxg.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_142312_328727_E9335C4B 
X-CRM114-Status: UNSURE (   7.24  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20210203192307.za-Isig44rqInBAoSsmCF-p3N4JEP1SOUycDuxpdUbU@z>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-soc

for you to fetch changes up to 726731566a862fa375de44313f601e49c4d40377:

  ARM: multi_v7_defconfig: Enable support for the ADC thermal sensor (2021-01-25 09:45:45 -0800)

----------------------------------------------------------------
ARM: multi_v7_defconfig: amlogic updtes for v5.12
- enable support for the ADC thermal sensor as module

----------------------------------------------------------------
Martin Blumenstingl (1):
      ARM: multi_v7_defconfig: Enable support for the ADC thermal sensor

 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
