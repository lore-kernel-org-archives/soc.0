Return-Path: <SRS0=o35/=NH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A7FC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:02:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC09660EE5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC09660EE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3TkFKNAQdUHSVEjgsEpszHhu3yWmSnfnQcvW9gbLFm8=; b=b8T3hfxpwsEkys
	sLrzeZON7XCEncecHSkThtK+NvweIvd5okb3cLl28b0VyIDZGk4ykVbWXJeMv2VenxkFCfYi68nQC
	8q2jF6qypyEU/A0zDyHTi00Gcs/KIEqwmj90HtpkDyrpTwCTd4QKfdVBVIZoReup0CgJsnt1FreEx
	WtHYZLgUuvTiI81stnG/o9F8/Eb3T4LMNHlkXVWI7XAVwb9jPTI2bZvFkrSeXxmWwEhvEnAvgwvSa
	3cDoB4tTVwR4MobM4/eSjyhsqs6bMyfGUTiUSLGTkEDjJkn9JZHv9j4GBVUIJsSPWbfkBWv5UoTZH
	9vQiX50WC6b0gMhmFN0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFjiZ-000HhC-F8; Mon, 16 Aug 2021 21:00:23 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFjiS-000Hgd-TR
 for linux-arm-kernel@lists.infradead.org; Mon, 16 Aug 2021 21:00:20 +0000
Received: by mail-ot1-x330.google.com with SMTP id
 l36-20020a0568302b24b0290517526ce5e3so15072454otv.11
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 16 Aug 2021 14:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u5UDbARCogMc3tk8X3SMDF68KW4wo6rxwxOPLfLDf0w=;
 b=alwKgKEVSmhx7VhAtCo6RC7luejxVz6EcoXZDb87WtX/dskllvt/aaVKwWLrXP78Ik
 rCrR+b1TkUREtNRoOl43x0dfUJkAN7BIG8u2QPl4I3f2Ki/Y6TBMATZ8rLp0HAirnxwj
 ePJtG1moMayyEN1BipWQcSlKiKyd6FryEmoxKWClsqA5VckEqrUYBC2Jz94l449g/914
 8Sv6M7xJ75l9IZkojPWfEuA88ad6ayVX0ISCCQp3VH5IPwBaWjuyA0DzNpB3zN0npCoM
 z9p6RmvRPAc0OVkriCTy2KTF7gUgVa3oQ3Sk3P5YP4I7nO5DjG+fuRpGX5cq9KFMq5mj
 QA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u5UDbARCogMc3tk8X3SMDF68KW4wo6rxwxOPLfLDf0w=;
 b=TmeegBRtHQMItvvn3o4pDlMpnMbXhXACsAaf5OUQp/zGAtx556H3ymiHjmiwGgRTl5
 J7TMWa274pDmXH/7SpXo4jOVmeGB0K6yN5ZlbVQI/4u8FPC68Fiq3IqHGAxPUC543OU0
 PW40x4hn8w0jkUmJKoKc7TNVktV3uR3h5m21Gu50mW+c/Gv6DZKH8+todA1jfjSUEEqg
 seltltG/c+bEr6WGMKP9brbQ56oKFi3vjtL/+DgmA5hm+7k0bLwSU0uo7N6ptE39Xu7o
 A37c3qsvYeKDFRo5xeeovX0oZzrC8QQAogrZhMKR7kIBsFPNwhXZvrKihgLIiWQYWS17
 xAfw==
X-Gm-Message-State: AOAM530NH6lU8n6+ULmGawrN3Gl01KzYHOG4e+cLL6ex5bRvVyG+fYMJ
 YuNJ7xj5fCcmm93pI48fo+AYaQ==
X-Google-Smtp-Source: ABdhPJwTHQKU7QIjZBBDi7fDrFKPBlbD2lE2h7dQyUE+Vhbo6ljOH7uWpaKol+rYbaSvqCqbqIi5hA==
X-Received: by 2002:a9d:1441:: with SMTP id h59mr72685oth.15.1629147615944;
 Mon, 16 Aug 2021 14:00:15 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id t1sm88145otp.9.2021.08.16.14.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 14:00:15 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>
Subject: [GIT PULL] Qualcomm ARM64 defconfig updates for v5.15
Date: Mon, 16 Aug 2021 16:00:14 -0500
Message-ID: <20210816210014.577699-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_140017_021366_F21CE306 
X-CRM114-Status: UNSURE (   6.55  )
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
Message-ID: <20210816210014.KuUevW3EXmJGrVsiQQXNcUvohOmi1Gso75VMD-UMqQU@z>

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.15

for you to fetch changes up to 20d7a9fb00ebc53e73d49df0048afb02ef92a635:

  arm64: defconfig: Enable Qualcomm MSM8996 CPU clock driver (2021-08-04 15:02:54 -0500)

----------------------------------------------------------------
Qualcomm ARM64 defconfig updates for v5.15

This enabled the MSM8996 CPU clock driver, enabling CPUfreq on the
platform.

----------------------------------------------------------------
Bjorn Andersson (1):
      arm64: defconfig: Enable Qualcomm MSM8996 CPU clock driver

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
