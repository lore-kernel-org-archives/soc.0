Return-Path: <SRS0=Lfaw=LI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3724EC2B9F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jun 2021 22:00:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB6D961166
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jun 2021 22:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB6D961166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=73OSSOmA8n0Ozak+yzrvDae+o29cIJOtR/+1NHYnjJE=; b=QtajSRA0MdGJ4v
	tN79MV71ZcYv39kjFxRjzy8gnwOoW5HUHdBtP9umU7L5P7uOFDDMRdjZdlapyzeAbUFM/vp/VROkW
	MXhP6igIhDv1rQZ64TEBOaeALKHFYv4F6a2+0A6rajBRgRNdimeiIWIc/N8OKTTpnEsX2mW3yOh8B
	joyEF4CGg/KGFsiIX3IzjI/shB95+8a+ydf2fgRklVa2va04H6Ghez156Ji+3rSNZLvo/a8L8JqQj
	ysZTGjz4Eh8y40GyGYHAzqjVOpa0QUCsE5W6OAdN8Tq1FD9YXjfOB5DNaTlK5r+xDE4qJ7s2HX84o
	e0qbnOWGQTVry0Etr3Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsuZp-00GL7Q-64; Mon, 14 Jun 2021 21:57:01 +0000
Received: from mail-oo1-f46.google.com ([209.85.161.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsuZk-00GL3b-Mb
 for linux-arm-kernel@lists.infradead.org; Mon, 14 Jun 2021 21:56:58 +0000
Received: by mail-oo1-f46.google.com with SMTP id
 67-20020a4a01460000b0290245b81f6261so3018794oor.6
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 14 Jun 2021 14:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kf+ubk5dO3qWw7TN9/qRwxXr2oNPOTNaRKSsNGShNAA=;
 b=GDqbFuweeTGZ2a1SSvdb2YxqmPw22uySKFenjY118WSwDgtend8M/LDZYCO+EW8lNk
 9WQWvr33aABEtxB+jhvAR1guKvaWaSn87URRr1Kb3HFJaYMgSzHlX/6BMD6FdfzEuRt1
 G2uCVV/zmkISVT+PNPdagwrfKLV9ewWQNZah4d9a7P5LMbIm3ig8FwGUeDBKBykO//5y
 M0wZkhw80DM124JUnmIHTpOXIEMF4GIuoqx7xYFDnlXS+hhF2pRGCK13Vj9VcQ2q9C8X
 J2zCl4XEvB0iEDONZOE4gfur+jcGqfFNHyQy6L8ZbWKRWOLAA796+RxPAGWRBFruKuiD
 lJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kf+ubk5dO3qWw7TN9/qRwxXr2oNPOTNaRKSsNGShNAA=;
 b=W4bGKk/F4sSSWWnsFuz5fz9xfdblyhY9TE0uXhGcKcFYVX0z7CoOzboJAnW1DAp1to
 reozWdVD2AedjWNbVOscOP7uxwy59NkREGSYSw8T8PHB0iNsTxtCp+r9M+blCHdROYnj
 VYBkZ787aXGOtc+Ci5Njwo0jR/HXbhqrVd2ehW1h3DUeiT0h1+lwF5fFpwTTtoAZfxE8
 DJHFKRZXojHYeBUzMRoWemSwYicqolIoVkbUisTCFKlsk08yjUm+G6QiiPKSQ64zPKW+
 y7IJBXk5mKVL7DUSCYolwmXmy310ngkyvgrNO9szdGuv8D37dt+ScEfmmnpT1dP7+/z5
 ThUw==
X-Gm-Message-State: AOAM533XIqB1ZmoAJXWMRupXvjeEmCDAtdSrTRM75jCcixG2Aq9fSvvr
 DHi6n73I8S5KLrk0bp7/op/784dehGa46g==
X-Google-Smtp-Source: ABdhPJze60kY0BnVIC/EqWz/84ZLD/HN9a08aQnVqGtT9Kobfrdym6lfnyDs9jYH3P0ec10qMMDv4w==
X-Received: by 2002:a4a:a744:: with SMTP id h4mr14827938oom.26.1623707753931; 
 Mon, 14 Jun 2021 14:55:53 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id 3sm3362790oob.1.2021.06.14.14.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 14:55:53 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Subject: [GIT PULL] Qualcomm DTS fixes for v5.13
Date: Mon, 14 Jun 2021 16:55:52 -0500
Message-ID: <20210614215552.391887-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_145656_799607_B463F71D 
X-CRM114-Status: UNSURE (   7.96  )
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
Message-ID: <20210614215552.HCO1ZVDCrQYjb0Y6eH7vt6b-C9pr5VE5yv4T61K4ioY@z>

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-fixes-for-5.13

for you to fetch changes up to 0fa1baeedf06765ec6b441692ba2a2e83b7d17dc:

  ARM: dts: qcom: sdx55-telit: Represent secure-regions as 64-bit elements (2021-05-29 11:24:27 -0500)

----------------------------------------------------------------
Qualcomm DTS fixes for v5.13

Failure to properly define "secure-regions" as 64-bit ranges prevents
the two SDX55 boards from booting, so correct this.

----------------------------------------------------------------
Manivannan Sadhasivam (2):
      ARM: dts: qcom: sdx55-t55: Represent secure-regions as 64-bit elements
      ARM: dts: qcom: sdx55-telit: Represent secure-regions as 64-bit elements

 arch/arm/boot/dts/qcom-sdx55-t55.dts             | 2 +-
 arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
