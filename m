Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41ECFC04A68
	for <soc@archiver.kernel.org>; Thu, 28 Jul 2022 23:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 08D41C433D6; Thu, 28 Jul 2022 23:15:45 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 12072C433C1
	for <soc@kernel.org>; Thu, 28 Jul 2022 23:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 12072C433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f54.google.com with SMTP id fy29so5566743ejc.12
        for <soc@kernel.org>; Thu, 28 Jul 2022 16:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=EMgR3r/5USP32zGR0vJlVbcUsNeEC3RV1rZfC68/TZ4=;
        b=DFmAxk+++JyHq3e6SsxFu2Lej6OEn+mKsyCIELvgqpY6A6MW0gKmnVGyFlju8Cyrl+
         atep2zO0iCCeUo75O3924iv/YN5TyG0aeEqRLknHNgFtg+9u8hQGoqwYPH6oJps5xCCX
         qTQVZbCWgsROJPygaqSZTDwBZ8XyOzeRPsInQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=EMgR3r/5USP32zGR0vJlVbcUsNeEC3RV1rZfC68/TZ4=;
        b=l0NMenqjxrAZzffLOPc6esCfFZNaee1dFTdIIeSiEDIvH1b4gwfc7iDe577TAOcIwp
         i874dHVOEzy3QAlamgPV6I0YxxuhGYhL8jin+lIQ0IjsoEfIJMxCG1RwIR8KakuEIuMi
         uV0BPso6Oug52sK3CkZiJ2magI13Rs8aOsCQTBJhiBfrT47764TlRmRDoiyyMQMf938Y
         tLlq4ggIhOeUs6d45un2wd3M0iERVoVHDOwNW6nxC/o3BBLCSV5Mz1eeC7ggxEsspLBf
         Rk1N126ryVGXg+hrcWLR22zWgWUmJC7vAgwQrw17X+k4Hv/cccTrlhenV2vr42/dvWP/
         zWxA==
X-Gm-Message-State: AJIora+mXzzj6oBQ+VsWFgzYB1/sUYRL6p4OfjZFjXLux9vzE4hy6IJb
	m41s/BjUYHhyQBb49sdThmPfw0uRjOrNdQ3d
X-Google-Smtp-Source: AGRyM1tclYjFuc0/X4zFdpk2JMY7w87lA+cKVWhkF+q1JxBF7kBBc16T9LOxjve9Kn0R4NYWOqkl3A==
X-Received: by 2002:a17:907:7632:b0:72b:4d5d:ecce with SMTP id jy18-20020a170907763200b0072b4d5deccemr849272ejc.11.1659050141972;
        Thu, 28 Jul 2022 16:15:41 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id q16-20020a17090676d000b0072b3391193dsm900377ejn.154.2022.07.28.16.15.40
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 16:15:41 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id 2-20020a1c0202000000b003a3a22178beso1728933wmc.3
        for <soc@kernel.org>; Thu, 28 Jul 2022 16:15:40 -0700 (PDT)
X-Received: by 2002:a05:600c:4ed0:b0:3a3:3ef3:c8d1 with SMTP id
 g16-20020a05600c4ed000b003a33ef3c8d1mr951437wmq.154.1659050140559; Thu, 28
 Jul 2022 16:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a3GTzeJUdcjVv-1fL7h7e6XRFPA65-5xseQ4=tyZE8UDg@mail.gmail.com>
In-Reply-To: <CAK8P3a3GTzeJUdcjVv-1fL7h7e6XRFPA65-5xseQ4=tyZE8UDg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 28 Jul 2022 16:15:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgdnnAmDopTKXbS5u3Ty8GgAfuFOSOycsCfe6pSAqunHg@mail.gmail.com>
Message-ID: <CAHk-=wgdnnAmDopTKXbS5u3Ty8GgAfuFOSOycsCfe6pSAqunHg@mail.gmail.com>
Subject: Re: [GIT PULL 0/6] SoC branches for 5.20
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 28, 2022 at 3:28 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> This is another large merge window for us, with over 1000 patches from 177
> contributors. I'm sending these early since I'll be out of office for the next
> few days.

Hmm. I'm missing 2/6. I don't see it on lore either, so I don't think
the problem is on my end..

            Linus
