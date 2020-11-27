Return-Path: <SRS0=Z36m=FB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC86FC64E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 14:45:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81F2620B1F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 14:45:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nmMTaf0v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qTX5yluJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81F2620B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RnxKFvA4oZOmtqCF+KY392zdF9J8lgX1n7sga7vNl6Q=; b=nmMTaf0vN/paoetGfNuvnd/B4
	ihKeZHgNkENxyELh1ntqB2qMWcRtCpZSt2nPSVYP44Q63aPYcQJaZpDfUMoQbXzfSAioTS/DfyePh
	3zyZAApKHxEgyxiXGZosD9mqzSrHc7eZfSkATlrRtZ0+6mcD1U0FB9Ovm7a7lnJGVy8Ov3+AUWiRU
	TQxP8IwtABBp9CZBl1IYr/XJ3vizg8Ax5vlGNt7xqdEIKpMRiel3wZkVrvN04G5zuYE8Cc3n1Z0Yo
	RaLikkncC+uGRIpqLNmFG5P4uF0FbfRjeHxwfYqIzbGyhGu5i5C5xW0RbXW32ex4IgclHfMNM7c6B
	jW8U8JIpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kieyj-0005VV-Db; Fri, 27 Nov 2020 14:44:05 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kieyP-0005Q2-Ve
 for linux-arm-kernel@lists.infradead.org; Fri, 27 Nov 2020 14:43:46 +0000
Received: by mail-wm1-x329.google.com with SMTP id a3so6724582wmb.5
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 27 Nov 2020 06:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E66e82fRjbScow6xJT3yXxFBjbOJVfEEhjtAQriMYH0=;
 b=qTX5yluJTR+gjG559VMKxKyB4azDDrCkoBv4QeHOuvJsl/hdRLroqXxdcgFbibuPQW
 sDsJqJ+hJjMYrtAXOTioDlimkwRtePMOgDvGCl34gekXWxAoqWam3/2sKhVlX7gnGPPy
 KA3KrUR89Fp1YBPuIwTL3C8fi4RRjWLt3YCgpw4T5jCSuot8hbarevvjzRODRC3TdY8K
 blnaKCZZ2joawr1sOBCOPPYf0ZDA1xp3iaJSYgpre+6pQ+yiTuv6fM0JD2jxZg0ePlQx
 /16fnLAn7Jkl9ARJN1XhGAz5XPSuxth8aof5YY/1R1jKFRbYzn1xDUgH2oM0gbY2GcxT
 WYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E66e82fRjbScow6xJT3yXxFBjbOJVfEEhjtAQriMYH0=;
 b=NpobJAN6YlZuhs/CVk1eVmexT2kVjZoxU3U31hWm/YIEhccyuX089EV241iPvylwQ+
 KMxZ9siUvsTZGYr7fwyDh5024fFP6BUL3RdcFp3F8tOKEzO2b35a5QaANAg+L8ZYHWG6
 TGJGseC/toZEh0FPOp7orycvjW6ZLrgpjSWRCqCS1uS7n+izGGSTe4PY/9LkJheRWOfB
 2jKwVkMkjN97N7FWo7OhxhgC0aTErYEiDVhufhi7USGl5YUmucT7mlMcI5pZFSCwt7Y6
 MbfIMshPb3SULnyizkplYeSZrAcNbmfOxf4bE86PpDItPc2b/nNFJcbT3RO7EBcs9Lly
 ev7w==
X-Gm-Message-State: AOAM5306DgzawqQrHsEO4ausU1imV8mEmAPkg7y0uiEArxvTvp+7x88i
 r5iuyNxBVd9iAK3Lw/Oc4kU=
X-Google-Smtp-Source: ABdhPJxHL8Adqw3W9Pc3nfQUhEt5UkMZSbh7wTnVWWyn5qeMtorPwq0+Qy62YalbVE+PugUEqqWylQ==
X-Received: by 2002:a05:600c:2314:: with SMTP id
 20mr5521494wmo.92.1606488224183; 
 Fri, 27 Nov 2020 06:43:44 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id i11sm15366030wrm.1.2020.11.27.06.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 06:43:42 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL 6/6] arm64: tegra: Default configuration changes for
 v5.11-rc1
Date: Fri, 27 Nov 2020 15:43:29 +0100
Message-ID: <20201127144329.124891-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127144329.124891-1-thierry.reding@gmail.com>
References: <20201127144329.124891-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_094346_089101_B23CC513 
X-CRM114-Status: GOOD (  11.67  )
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201127144329.fE0h37yEdVfOLMaWwaKllT_5x3rhVlvdX_gQrhW0Z38@z>

Hi ARM SoC maintainers,

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.11-arm64-defconfig

for you to fetch changes up to 35552c7cb672d2cfd6c4aa2e28b15fdd12315555:

  arm64: defconfig: Enable Tegra234 support (2020-11-18 11:51:53 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration changes for v5.11-rc1

The Tegra234 VDK support that was introduced in v5.10-rc1 is now enabled
by default.

----------------------------------------------------------------
Thierry Reding (1):
      arm64: defconfig: Enable Tegra234 support

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
