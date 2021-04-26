Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872CAC433B4
	for <soc@archiver.kernel.org>; Mon, 26 Apr 2021 19:39:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 568C56135D; Mon, 26 Apr 2021 19:39:20 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F77C61396
	for <soc@kernel.org>; Mon, 26 Apr 2021 19:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F77C61396
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=torvalds@linuxfoundation.org
Received: by mail-lj1-f172.google.com with SMTP id d15so14254960ljo.12
        for <soc@kernel.org>; Mon, 26 Apr 2021 12:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TLJVtvvBoq/yqMsEsQp2CVsNqoS4kEVzTchedKnBltY=;
        b=NxuUruDr2lHnywJ3Z+r1UAHxMhgCb3UXfYiRrhPJNqo/FGK2U0yh4/vlZZ85hcv7nA
         3HvU6GlJWZRop3dtZzBjGWObyYxvKgpbeCBjOIoUeouS04fHBeKbz6C8bj89JWN2R32/
         AsOVH7NQyCezbLTnpC+iiKrKnd9al2JuP18Ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TLJVtvvBoq/yqMsEsQp2CVsNqoS4kEVzTchedKnBltY=;
        b=c1LEAkj6fB/0l6WkQ4D2c1CB0Y12rXVC1enEoKlYIvedj3OleelCqzl/oY5cCO7SZ5
         FtvoUuHiC9DGGV3GlT84JydSu+sECxW6ftU+5EBoqhhbLl5z2fCLOXqWTdsDcUAdXFGn
         zYtKPKNBLxJhQJyFsKt3KOl0fhw1InFVy0swMxlcxuWOTTOCfXwh6edj1yqal2aoio7F
         ZW/bcPnJ7kpO1hM2yUsCJCH9iCyQ2zZFzRFEljQON7d/9WnRi7K3DWy7KlIaMh9/qrdf
         KcxRWJ+PgniSpzE3chnm16QxQQxXL12AakyCg2yQSgYSh1IYkE9tdy57SMftw7V2vf2L
         5pNA==
X-Gm-Message-State: AOAM532gUK41fFnfClmgFcSUxXzDerTuqBJxxpfe3KRtK0to7HYqjhPO
	oPert6FFPMAQCVg06df4fC4hszM6OYJBegtJ
X-Google-Smtp-Source: ABdhPJwilCiQto1RPgY5gErXohjRXX6TTF6t0fU6zfNBrI7SprU/0TxLlgZYQUfw5Kh2+ACKbGE/tQ==
X-Received: by 2002:a2e:9ad6:: with SMTP id p22mr9134860ljj.358.1619465958300;
        Mon, 26 Apr 2021 12:39:18 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id m8sm88146lfr.55.2021.04.26.12.39.17
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 12:39:17 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id u20so65518213lja.13
        for <soc@kernel.org>; Mon, 26 Apr 2021 12:39:17 -0700 (PDT)
X-Received: by 2002:a2e:1406:: with SMTP id u6mr13608357ljd.61.1619465957464;
 Mon, 26 Apr 2021 12:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
In-Reply-To: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 26 Apr 2021 12:39:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgDQ23kEkVVhjwcVPkQCDUVmJJdhO_HtjaRRCv_mtZgag@mail.gmail.com>
Message-ID: <CAHk-=wgDQ23kEkVVhjwcVPkQCDUVmJJdhO_HtjaRRCv_mtZgag@mail.gmail.com>
Subject: Re: [GIT PULL 0/6] ARM SoC branches for 5.13
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 26, 2021 at 8:53 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> Here are six branches for the SoC tree [...]

Ok, all merged. Please do check my conflict resolutions - not because
I think there is anything wrong there, but simply because the arm side
doesn't get the same build coverage testing when I merge.

All but the two first had some fairly trivial conflicts with the other
trees I've been merging today.

              Linus
