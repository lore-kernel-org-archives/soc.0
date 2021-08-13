Return-Path: <SRS0=C417=NE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 381A2C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 16:25:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB26161042
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 16:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB26161042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1oXgp9x3n4SBUcHPMMxt4ykZQuvP+rZwOyBAK7Zk0OA=; b=TJn7RQuIzKmHLD
	xYTSBuvhNs8OBcQzMbbUkt6lSasNt+xfM0pHQB00WCOGhYaulEQK7s5NB7VoPmjzDrHVjC43BTi33
	kF/VHZ+qBJvyYgLxju6J+QO/uqJuKUE2121e+621jLKVc4RvvTq3kEulq8/D1GO5Zm8N39uEaZdGN
	YFVVlrIMkvydq04pYG/MCqZxkctqph0titdm7Q8j9VkOt30YpS1osAlmpYvDqvq7M3xASt5mV/1Ao
	jJ34duHhgjdKF0okekFtzJJ1LvzmPRoDtqZ/84T9mvwA7/2uNMDdccR6YcaKfMY5ZRAWrGRc2SWCI
	E1lh3YJC6widr1+CLKvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEZxN-00D5Oc-GY; Fri, 13 Aug 2021 16:22:53 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEZwf-00D5Ce-41
 for linux-arm-kernel@lists.infradead.org; Fri, 13 Aug 2021 16:22:10 +0000
Received: by mail-wr1-x42f.google.com with SMTP id q10so14062378wro.2
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 13 Aug 2021 09:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hL2E+OHMaEPvpW4ofvFox1pZWIDm0uZSMYdfM4ARIh8=;
 b=sZhtKvUnMsvvGQjtf3803c3v8rIIlRbZdxTiwZFpS207ksRQ4dK4EwS/c+XIWwih7E
 PX7cU7ob6GiI+qri200jPcbtzqAYlkNM+trDulTpJw5ck/rweHRdejz9f4vQOMcKLMAJ
 qWeFCO9pQa2+UrPOV3SG+S7puwjC3NJQlOO1/WkhwMbISyzVzaVsaSM/RSlx8jfpM7SR
 jUV1J0cUaP6VMnNzpwwAHz9YDLc1KlnvTOsJFeR0BdO5DBO7/tALZ3BFvLXrylHiU3eQ
 TFFimCWLYGfvrKE5JAmN5v3cWwttQnEhiHGO+eyJEgvUdCh84tXQx+SqrdD8guVWDRr0
 Sxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hL2E+OHMaEPvpW4ofvFox1pZWIDm0uZSMYdfM4ARIh8=;
 b=FCyDqc2efQxIaR92UC20HmaeqlnOyVi/schSHhcxajkWsB5I86fBRwlwYrUJg3lIhd
 6MIDMMpx41UcN8MpbYsQG3ZlQG7lOM+lnOakQdrtVPGpBlL+S/kXCAX535JHMwGUBula
 VTTj3oeW2mlxR2lTEYI9ASftnP/a9Gafuq3DxIQTeNW9vaTuBNeQyOjR7p0iiPAgNfiy
 x/tiIOfG1DcObCOc1eEAA3DcketLRqQm/7zcDYaO6SjPXKfu6XvYRm0zYEAXeXJz46JR
 fSFXV6apweRr1CqDf3CZSNgJn3cQw6/8/xhMJZBbomtaShYEQfx+GKBYzb0sATezIMNj
 vs8Q==
X-Gm-Message-State: AOAM531GEr3ePy8SatBD/MkfQqId6FnaLxXJPwfcXB5fJygnV/qqXady
 KoamwKMygJacTCFSH7zidBo=
X-Google-Smtp-Source: ABdhPJwzR+Uowa5MQLzSxcsOnFulMAAm1lotJXL0blvGBNnYk/iRwy07QQUX8ZBrJwBpuoQ2jds9KQ==
X-Received: by 2002:a5d:4dc3:: with SMTP id f3mr4226800wru.302.1628871727392; 
 Fri, 13 Aug 2021 09:22:07 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id g9sm1812124wmk.34.2021.08.13.09.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 09:22:06 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/6] ARM: tegra: Default configuration changes for v5.15-rc1
Date: Fri, 13 Aug 2021 18:21:56 +0200
Message-ID: <20210813162157.2820913-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813162157.2820913-1-thierry.reding@gmail.com>
References: <20210813162157.2820913-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_092209_206158_4BF0138B 
X-CRM114-Status: GOOD (  10.03  )
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
Message-ID: <20210813162156.ZAtEKMDd3xziaBltjOlmnUTQYrOtMw4o4DcuYGmNwjU@z>

Hi ARM SoC maintainers,

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.15-arm-defconfig

for you to fetch changes up to 806b99206b840bcf3bfa44227dc978880d13ed1b:

  ARM: multi_v7_defconfig: Enable CONFIG_TEGRA30_TSENSOR (2021-08-11 12:15:48 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Default configuration changes for v5.15-rc1

Enables a couple of drivers by default so that the configuration is
useful on more devices. This also rebuilds the tegra_defconfig, which
hasn't been done in a long time.

----------------------------------------------------------------
Dmitry Osipenko (5):
      ARM: tegra: Enable CONFIG_TEGRA30_TSENSOR
      ARM: tegra: Enable CONFIG_FB
      ARM: tegra: Enable Acer A500 drivers
      ARM: multi_v7_defconfig: Enable Acer A500 drivers
      ARM: multi_v7_defconfig: Enable CONFIG_TEGRA30_TSENSOR

Maxim Schwalm (2):
      ARM: tegra: Enable CONFIG_CROS_EC
      ARM: tegra: Rebuild default configuration

 arch/arm/configs/multi_v7_defconfig |  4 ++++
 arch/arm/configs/tegra_defconfig    | 25 ++++++++-----------------
 2 files changed, 12 insertions(+), 17 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
