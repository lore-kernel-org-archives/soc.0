Return-Path: <SRS0=cQz6=H7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD628C433E9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Mar 2021 12:37:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6303664E31
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Mar 2021 12:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6303664E31
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ew3GaIHhjTkLDSWyHZe25MejfvHK+9O0u+Z2dq49BeU=; b=M8UGTXM/iAmGJfdKZVC1Vjkmes
	aFLVvfENcZd/fL85hVT1h1BLKdZ3U/3aXrKA2V8NlgluYe/p4rb670obUFjI0/QQU62870TKKON4R
	kjcU5kZV8YQEfccz572B+tsngIN93fLYAl37iEmaOGJTGflnskSfxAcFBzdnPzPssvBjUoDDoTLU9
	y7iE0g+VTuJ5dkJML32YgeCS2/R20ECVsA+WiqJemVkHQMeY0fa9jCHWVEdEIJW1dT84jynLR+0cD
	UvaADceOH887NJB9UdfaIyYqRIh7SPF6X+pnw7Ensb8dNiOsiPKIxH7FfZG9A4Tc3kgum6U/Un0nl
	8EEwIElw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGhmh-0004Kx-Q8; Mon, 01 Mar 2021 12:36:23 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGhme-0004Ju-Ps
 for linux-arm-kernel@lists.infradead.org; Mon, 01 Mar 2021 12:36:21 +0000
Received: by mail-pj1-x102c.google.com with SMTP id e9so11739403pjj.0
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 01 Mar 2021 04:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aHKl2ifjfFue0mX7AlhZwlZkgYLL6KuO5Evur3d7teY=;
 b=rtiZd5gC6kPJr3YwWqhGX23hoyV/0rnI1ney+wD2Qfu/xruPUrh6WhKRWaGTO/EvDQ
 5BRqCCUgOxplOvmZA3aERlUOS5SYSL/fiTG/Oav2IUtdohRqUMg91wQruJkyRdu4Sge0
 pZ8vDbJjDZfLJ8rRP46CyoGEH5Zhdn+cy6arY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aHKl2ifjfFue0mX7AlhZwlZkgYLL6KuO5Evur3d7teY=;
 b=fKkL0hq44SqszZ2OxPeINK8KZ0t3MJ3vFa8dBc8gqqmc4f6W0eArgPtq3IttV1Yzf2
 uCKqufZPiPPpZAO9o/uTmnbkR8T8dpzJmJZ5KRwmsOPg22tm7yOImZsh9F8z3DpHt8Te
 /DwzFnwzrJfEsEA7sw12d00s9k25k5DNYX0W/5esL5sWsG2CR/ZsjiFE41QZU3EYWAWu
 0AtKjPF8s13RfULYh+iDdg/YvMPRmo6VkaJXcXe08YgD5i7XRAFaleOXAFCv3yJF8aIg
 HygefudSx7HsodmYsn9qzF2/4NE0BkCQMQm+T+UYt15DlDl0yG1xoN/1yvJRdEayzr++
 H43Q==
X-Gm-Message-State: AOAM532MJwjAWX9g8JWd9AShdrnlAbv38MRRbncIw15hhRTauohYmzUx
 syy1sCi3DwwLeC6AAyj3p4KxXg==
X-Google-Smtp-Source: ABdhPJxOr/a6RlVgTyLEJ1PiMM+lPrd84tutb8D9p3gWD2fgAKluwDJh3vEg5M+cXvXJHFimSWH0wQ==
X-Received: by 2002:a17:90a:13:: with SMTP id
 19mr17624768pja.116.1614602175901; 
 Mon, 01 Mar 2021 04:36:15 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp.
 [124.98.97.188])
 by smtp.googlemail.com with ESMTPSA id 8sm18130928pfp.171.2021.03.01.04.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 04:36:15 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [PATCH 0/3] ARM: mstar: MPLL mop up
Date: Mon,  1 Mar 2021 21:35:39 +0900
Message-ID: <20210301123542.2800643-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_073621_007225_C1341B9C 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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
Cc: arnd@kernel.org, Daniel Palmer <daniel@0x0f.com>,
 linux-kernel@vger.kernel.org, olof@lixom.net, w@1wt.eu,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210301123539.MMceowEVIVw5L_D9GvrAvLLBuBA-0QNyaJeFZGyq9_4@z>

This series is just 3 small patches that got left behind
when the MPLL driver was merged.

Link: https://lore.kernel.org/linux-arm-kernel/20210211052206.2955988-1-daniel@0x0f.com/

Daniel Palmer (3):
  ARM: mstar: Select MSTAR_MSC313_MPLL
  ARM: mstar: Add the external clocks to the base dsti
  ARM: mstar: Add mpll to base dtsi

 arch/arm/boot/dts/mstar-v7.dtsi | 23 +++++++++++++++++++++++
 arch/arm/mach-mstar/Kconfig     |  1 +
 2 files changed, 24 insertions(+)

-- 
2.30.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
