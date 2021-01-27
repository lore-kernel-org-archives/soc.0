Return-Path: <SRS0=O9cP=G6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72378C433E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Jan 2021 18:04:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9FE464DA9
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Jan 2021 18:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9FE464DA9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IY0/PuqN03/UILMXIYWg7i0rVjBTOCkNPQNMGmrKDLg=; b=Hmo9Walooeyw2EOw6xXQJ9i39c
	KdrRmCe46horbRAEtmIpOZoxBMWKOP9pSpwriSTuNuSalZCWqdn1jG0NRYf+oM6s58MnJZkJTStyc
	8sbEKI6ISM9eDW6J9Y5ViN/ue+aybjOLj5yJBz+JsnoeUA+VJhyDbjXBYooD1CcpXrmvKuwNKMDR3
	HfDrj7LhHjXPpcexyiFFF7bbpjcNG/+pYsg+W+J+Eh32M4I5yyTRU1KUfIcwj0dQSKR73jeeqwbyk
	Wd1lcGextUYNccU9rUVGfy8g3CFELcWnCamsgKmSZ6aWrdkYlCrzv6acvnNjaho0VKngT6YYqsebv
	fx8pW0xQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4pAr-0007iU-Pm; Wed, 27 Jan 2021 18:04:13 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4pAl-0007hC-Tr
 for linux-amlogic@lists.infradead.org; Wed, 27 Jan 2021 18:04:09 +0000
Received: by mail-wr1-x42c.google.com with SMTP id 7so2894708wrz.0
 for <linux-amlogic@lists.infradead.org>; Wed, 27 Jan 2021 10:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=KWqNh8H9jxNujMamWE5tQ90c+C/64uDI1+7zlC8RlOU=;
 b=FvHguWbJZsfCtr97HAU4oObBcCxwx8i+tTMOp3CL+atazyIAjaiOB1RrudyWlAdY0P
 6YcbcYvX1RLD9UI35zd4tMLXT+pS0dpmnYQF2Hk5nFWYu5bcD9sfdPuAjmBaeR1ccC2w
 yxMQjX4QGcULH4wzCX8ODJTC29fQYxXULmPQs9YbTcwK9tUx0pv0gMAHtffGavGsdraq
 +cLjMwr0xEorOHm/zarnjJkmMlPtSnfBHNbTxD0h5gmBEO4iwNAJw0+Qqi2+yw+JbnHw
 AS/qBAwDjenxh7UDo+vv4+NlmEtO/eAtK5UH2s6/v8ovnUEz9OQ5mi38/4NPI9Xj5cGT
 4HuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=KWqNh8H9jxNujMamWE5tQ90c+C/64uDI1+7zlC8RlOU=;
 b=nt5GA3FlJRmIbrSnOn+MPOul90bvtVq3W2Yvda+gZvtO3Kf7r/6bjNC5ZMgrDS4v/X
 W46pvKANE8XqSd5Nq7gWzWCRMnQE+2fa4SMl6G5CBcYpuIuKwuDKaJWrZVNYxgsAOPn7
 /qQznqhSBM1v22O41z+rCHnfAYFv+0emZH1xbphxGnNW4i+lOuufHL8Lwb60YqbcP2ad
 RCXWs9h5mYjTwm3r+ae0FCkclpQqsLM0gEtnFqi5Rq7O2tLgwKCKY0fRQAc9k9Ws0uir
 DxPUG3/5+F0KkVT86tVCuKnOJgejt6IAgraqE4MzLLCQskYoxsYpSwFdpNlpR34yt/oq
 HL9A==
X-Gm-Message-State: AOAM531FhKE/Pc40yX58aeUc3C2+PTfMIiwGoYY7idQ8KcvzFHPZdepz
 f0xxyUcjP/esd8RG3SSRE8AzJw==
X-Google-Smtp-Source: ABdhPJzoVQF8wAyVtyXUunZs+vFdUnlobMjssvzSGi9p305OKTw5SJ11zXiYlUrdWtE/784foYAKWA==
X-Received: by 2002:adf:dd0d:: with SMTP id a13mr12423872wrm.143.1611770644971; 
 Wed, 27 Jan 2021 10:04:04 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id r13sm3457725wmh.9.2021.01.27.10.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 10:04:04 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] arm64: dts: amlogic fixes for v5.11-rc (round 2)
Date: Wed, 27 Jan 2021 10:04:01 -0800
Message-ID: <7ho8hai7e6.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_130408_132168_9D442E17 
X-CRM114-Status: UNSURE (   7.09  )
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
Message-ID: <20210127180401.uQ90jYJwgSGRWwKEx8lHCPCYtS2E9EsyFns8E7ePxCU@z>

Arnd, Olof,

We found one more regression in networking on amlogic SoCs needing a
fix.  Please pull for v5.11.

Thanks,

Kevin


The following changes since commit 7386a559caa6414e74578172c2bc4e636d6bd0a0:

  arm64: dts: amlogic: meson-g12: Set FL-adj property value (2021-01-04 08:03:49 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-fixes-2

for you to fetch changes up to 19f6fe976a61f9afc289b062b7ef67f99b72e7b9:

  Revert "arm64: dts: amlogic: add missing ethernet reset ID" (2021-01-26 08:02:35 -0800)

----------------------------------------------------------------
arm64: dts: amlogic fixes for v5.11-rc (round 2)
- fix ethernet resets

----------------------------------------------------------------
Neil Armstrong (1):
      Revert "arm64: dts: amlogic: add missing ethernet reset ID"

 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 2 --
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 --
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 3 ---
 3 files changed, 7 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
