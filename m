Return-Path: <SRS0=ZdLY=BS=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C2DC7EE29
	for <soc@archiver.kernel.org>; Mon, 29 May 2023 11:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8C3F6C433A8; Mon, 29 May 2023 11:49:46 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D0E68C433A4
	for <soc@kernel.org>; Mon, 29 May 2023 11:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D0E68C433A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-bacfa9fa329so2561350276.0
        for <soc@kernel.org>; Mon, 29 May 2023 04:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685360983; x=1687952983;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V84958JmfDAaMBphRDoQ3FcOJekkgdT16i/ld3UVtUg=;
        b=l1EZFxRiO7o+iQ5lohlnp2iu0TFBvAjMdTzXbl+2z/NOxV1WvPArRzdEAjQejzNHd6
         N1n4kh7YltStqYOvhsS1B/cuyiJRsnXr67TNskxOXnQUtdbE/ZOmsQ+2V4VQYjNOQXF9
         yl8UhOOKmYYiBxvPG+cnXUmyiPBQgvmK89TrqpHAH1E+11/Mb+tr8Co1L87IjpCT3z+s
         E4aC0YHIZHCfvM/Y5ykBNrhYkRVbNQHIGusvLrcPWe21J2IIHuqfZCbXMxvCDn2SYcS+
         A4nJE6rV8VLT+D6cnsjFiG5rLy0mHUoM6GYUwVrnVmwC4/ohJBPqAO3lq4Boptd7CwU0
         zteQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685360983; x=1687952983;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V84958JmfDAaMBphRDoQ3FcOJekkgdT16i/ld3UVtUg=;
        b=Z9lJAFhR6OSBvp85UE87nMoP5JmSuS4Wy/xPgJ1QJrVjT0ldKjlnQTMaS8lziTbn4k
         872v95gCgcIwbJbfI2EjCgaHXUauRbZWJTjW/r2Oi+EDDrZLdOJ1X/JIZktIy1kIt/AG
         oleUFTlnXkVPbEvQalkmQ9P8N2O0o+q5/9oaUpDm2gfDPe/rxmIK7sDS8/qhSN/hjySM
         qDXgfjSeAU3JueDiH4ytk9VmDpMkMk1mC999Rli2Wlsp/ixULW3ExA1sOK1OcKuOStUg
         jV/G0j3isRmSVJfuoG+TcWnUsJpy1DyO4Q+ceggHyLLS4L2wd9GcZF/FPyigAUFdOf0k
         9xZQ==
X-Gm-Message-State: AC+VfDyYmoqTNVMLJfKHaTvz0WEDyfDcrQuTQPAgkYTnHs5wF4chGBAG
	tuqi7+ck6m+j+yG72FB8GeKXjLfmESxr1vCn3Uv/XcDcRoU9uGUAhi0=
X-Google-Smtp-Source: ACHHUZ5q3el4y+WGq/Tt24topFA6rBfGjz/08N/yS/uIaSXkPty0rFiaFsDVkf+PjZCo9OXL5QcG9iYlmWwpFpWzDs0=
X-Received: by 2002:a25:b18c:0:b0:ba8:6766:3607 with SMTP id
 h12-20020a25b18c000000b00ba867663607mr10770810ybj.48.1685360983340; Mon, 29
 May 2023 04:49:43 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 29 May 2023 13:49:32 +0200
Message-ID: <CACRpkdZ2YLzB-n+1M9u0UqVfct_LAR5cLvYyJhxHsXNR_TFzpQ@mail.gmail.com>
Subject: [GIT PULL] Ux500 DTS changes for v6.5
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC folks,

these are some Ux500 DTS updates for the v6.5 kernel cycle.

Details in the signed tag!

Please pull it in.

Yours,
Linus Walleij

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ux500-dts-for-v6.5

for you to fetch changes up to 56f0440f27b48948122e5a739fc55c11b23bc821:

  ARM: dts: ux500: Add eSRAM nodes (2023-05-17 08:56:22 +0200)

----------------------------------------------------------------
These are some Ux500 DTS updates for the v6.5 kernel cycle:
- Define the SRAM nodes that will be the preferred way to
  specify SRAM segments to drivers going forward.
- Fix up the naming of the STMPE nodes as we are merging
  proper YAML bindings which puts restrictions on those.
- Disable charging on the Ux500 HREF boards because these
  do not have any real batteries connected.

----------------------------------------------------------------
Linus Walleij (3):
      ARM: dts: ux500: Disable charging on HREF boards
      ARM: dts: ux500: Fix STMPE device nodes
      ARM: dts: ux500: Add eSRAM nodes

 arch/arm/boot/dts/ste-dbx5x0.dtsi       | 73 ++++++++++++++++++++++++++++++++-
 arch/arm/boot/dts/ste-href-ab8500.dtsi  | 18 ++++++++
 arch/arm/boot/dts/ste-href-stuib.dtsi   |  5 +--
 arch/arm/boot/dts/ste-nomadik-nhk15.dts | 16 ++++----
 4 files changed, 98 insertions(+), 14 deletions(-)
