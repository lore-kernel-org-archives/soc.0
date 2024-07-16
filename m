Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E78C3DA59
	for <soc@archiver.kernel.org>; Tue, 16 Jul 2024 18:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 830D5C4AF0B; Tue, 16 Jul 2024 18:56:05 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5C82CC116B1
	for <soc@kernel.org>; Tue, 16 Jul 2024 18:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5C82CC116B1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-58c2e5e8649so87925a12.1
        for <soc@kernel.org>; Tue, 16 Jul 2024 11:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1721156162; x=1721760962; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7AkWFffnhNj8OhWOczo1nmTY8DhOykx9MPZ068Ia41E=;
        b=HXN621bUywhjF0RznQExKOLyY/+ClL9F+O7e0wrbZEQv2ofX6jbVzwy2gBZRxq5b/x
         CYvcgNBqWtl6XWkRUugMBZACh4ou0vkcSNUhZJY2klep9J1C/mjcpcJwBVJ4nK/dl555
         ggjJyXu9Hx1dXMZIUYZcgrdq+QadLydYWsZgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721156162; x=1721760962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7AkWFffnhNj8OhWOczo1nmTY8DhOykx9MPZ068Ia41E=;
        b=wqiSx2kcqhV8zYE+9U9pxXNSScGAybOxFePF2RZB3e/90MacOhHUUZcdUA0vduIBKe
         PovU84FDqhG3b2GgLDqT+VPgnaXcoepsD2HPnPvNrN3oTuMPvvQNPvT974RGWn1P8DQT
         tsDSDrpfPsS7oiAMLfvgKh5BZktMxGmc3HU+b7jYAk4P2sajEtNKeASRm09vIzDurM4b
         fVrThhZurOll5UYzZsPKbMPxBEh7eAlX7pa/owpQt6gDjxfONU3Ji27eRX4rwfWNU/yy
         I1mqTIKCd8Fpf/ClZ7p0dg4gAg0eGJAJ9OxCedic1D/qTdxjTk7f7545+OPVFMS6mVs+
         xtkA==
X-Forwarded-Encrypted: i=1; AJvYcCXGNnjHldU5N4f+01Apf27OIOrx30dCq9bli5wiHduf5OefwGIwKNpBWJrVkBPWO0UBbsrwy+7m1rV562+02g==
X-Gm-Message-State: AOJu0Yz9xzzIfu6d46U3hBSkgaTG1Welr7EEb95jRBiKT6PNiUgWnPM/
	c9W5UKQmO5dHvf/GWtw2oRp4fcKiCo2wFz6xCeDZd16q7NcabW1+OvVgoLrQBOs0he84NH+kwHt
	n9NuU5A==
X-Google-Smtp-Source: AGHT+IFr7KuQgN5jMdNqB6YCPkgIxYqDOBKEq7786zqwTZtxbJ4/0fLR9JElrj5ZiaJLncU1CmSs9g==
X-Received: by 2002:a05:6402:35ce:b0:57c:614c:56e7 with SMTP id 4fb4d7f45d1cf-59f0bc2450amr2636648a12.18.1721156162571;
        Tue, 16 Jul 2024 11:56:02 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b24a76c96sm5328089a12.18.2024.07.16.11.56.01
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 11:56:01 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-595856e2336so102631a12.1
        for <soc@kernel.org>; Tue, 16 Jul 2024 11:56:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVpIzbODQX6xwE8yfpG4aZ8adMfhQkccvLT7qmC48NaVYay4DbR2Ic+XRMpoLpBwnjyfE86Hf2NaZKxOvUzCQ==
X-Received: by 2002:a50:999e:0:b0:594:4d7e:1b6b with SMTP id
 4fb4d7f45d1cf-59f0ae05d51mr2757719a12.5.1721156161538; Tue, 16 Jul 2024
 11:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <fe3126a0-7c32-426a-9997-77d76ade5179@app.fastmail.com> <b55b7bb8-97b6-4d25-9592-8213ecfe7b6c@app.fastmail.com>
In-Reply-To: <b55b7bb8-97b6-4d25-9592-8213ecfe7b6c@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 16 Jul 2024 11:55:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=whp2O+NjOXf77hfATgEe-LHTefbFb0eR=ytQUJTOUnfdQ@mail.gmail.com>
Message-ID: <CAHk-=whp2O+NjOXf77hfATgEe-LHTefbFb0eR=ytQUJTOUnfdQ@mail.gmail.com>
Subject: Re: [GIT PULL 2/4] soc: dt updates for 6.11
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	soc@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jul 2024 at 14:03, Arnd Bergmann <arnd@arndb.de> wrote:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.11

WTF, Arnd?

This doesn't even *build*:

> Jagadeesh Kona (8):
>       clk: qcom: camcc-sm8650: Add SM8650 camera clock controller driver

because it has

        ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_sm8650_desc, regmap);

which is entirely wrong.

And no, this is not some kind of merge mistake of mine. It was wrong
in your tree.

qcom_cc_really_probe() has always taken a

    struct platform_device *pdev

as the first argument, not a "struct device *". So the "&pdev->dev"
thing is completely wrong, and always has been.

Looking around, this was also reported by the kernel test robot at

    https://lore.kernel.org/all/202407072331.baglL4Sd-lkp@intel.com/
    https://lore.kernel.org/all/202407072212.WptVaUDt-lkp@intel.com/

and still I had to just notice it in my local build test.

I did fix it up, but this is *not* ok.

               Linus
