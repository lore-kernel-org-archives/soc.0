Return-Path: <SRS0=3HjL=PI=gmail.com=romain.perier@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 937FBC433F5
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 16:30:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 753BC61354; Wed, 20 Oct 2021 16:30:09 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AAA961260;
	Wed, 20 Oct 2021 16:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4AAA961260
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id u5so7662593uao.13;
        Wed, 20 Oct 2021 09:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5caiCMTP2cHNzS4IuisPKtBRNIaBTwtP2qKMTIl/yAE=;
        b=CDHhkFvkKFsn5S8MYqdHwzYlGwxiaE3OmWB3tLSf3ZMH4N4y3S3+XCgeodxSbJQ+62
         Xfc+CO/d5B/KFnW93ZZEXuNTYp9PW6VS7M4fneoVpYjdxMG0du7vfZcPox7OAMNbQ2gB
         8VX9pnaeHVN+KPRWRuePg++ukZVS82HY7SMMbAa690rXL4VrdRrdSgxBCvC7M4jPE8E1
         wibJIqvYkGcd/3ge4TCF2qA+sUNExDUlwzPe99NglFdZBPstMQolcmYzp38oDNEsCTIa
         9ynSKTZ3rW1p3nz6VRrWibYBBFKyWZikxwC9zSq8qURFhYKqlIqbOdJwKs3YEia8IFAA
         taTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5caiCMTP2cHNzS4IuisPKtBRNIaBTwtP2qKMTIl/yAE=;
        b=0+/yW20eyF1qZ2ssdq4oBOO97hbMKpNJ2O7P02znymoiPiWbzlGvm1kkQAT2W/DHiQ
         7WHDGmwv2UCH9rh0p9Dr3RzEFo9bELhatFW62sV/dLq9FMsniyw3Kd2r6aE7objORZaK
         1RwTCod95HtKFojkHGmZR7d6DKILeBF6K21asKxjfmK0BgOz4yi5KiMjfLVQo7aGsT04
         KeBUhVJ8BQRS3zr26B9VF23zMFis9PoK//FZsbXFWjw96eJUw0Jskk2xnJ+X73SjpvUj
         UhPTb4oExCVPqYFl+2JzhldXoAEnkMZIfDiSMw9SkTeBGuI/jPQPzc1Wb0IRLuqDCnAF
         Q5Xg==
X-Gm-Message-State: AOAM531rVMome03/vDIHBbcWL97TiabTEvmlVDGUk+OUsKj1SXoMphbn
	0+L9lHXoeaz56ikrBmiwP9B5FGsQeHxqMbzdJkEQtRmv
X-Google-Smtp-Source: ABdhPJy13kMUma4/p0kTk20RSSMl2/hidWbgRe17hUa1/tUPefdY4Ij5jef6A43XRsbYgwgCd9hunLVT4hKjvEslYc8=
X-Received: by 2002:ab0:7a53:: with SMTP id a19mr218376uat.126.1634747408383;
 Wed, 20 Oct 2021 09:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211018095848.19101-1-romain.perier@gmail.com> <CAK8P3a3vOyqFOf0iFZ9UaUdH-kF13ckYA4Qh56zmSzSvr5dGLg@mail.gmail.com>
In-Reply-To: <CAK8P3a3vOyqFOf0iFZ9UaUdH-kF13ckYA4Qh56zmSzSvr5dGLg@mail.gmail.com>
From: Romain Perier <romain.perier@gmail.com>
Date: Wed, 20 Oct 2021 18:29:56 +0200
Message-ID: <CABgxDoL1c4kVEzj7sAn-8FTx6kB90yY0we9Zzfpi+r3+6mYQng@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: dts: mstar: updates for v5.16
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Daniel Palmer <daniel@0x0f.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Arf, my bad ^^

Ok then,
Romain

Le mer. 20 oct. 2021 =C3=A0 15:31, Arnd Bergmann <arnd@arndb.de> a =C3=A9cr=
it :
>
> On Mon, Oct 18, 2021 at 11:58 AM Romain Perier <romain.perier@gmail.com> =
wrote:
> >
> > The following changes since commit 64570fbc14f8d7cb3fe3995f20e26bc25ce4=
b2cc:
> >
> >   Linux 5.15-rc5 (2021-10-10 17:01:59 -0700)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/linux-chenxing/linux.git mstar-dt-next
> >
> > for you to fetch changes up to 7e626b6d71e7678e85e9e06e9e2271b5923741fd=
:
>
> The contents are ok, but you have based the tree on -rc5, which would req=
uire
> me to backmerge the new upstream contents into my branch and mess up the
> git history.
>
> Please rebase on top of v5.15-rc1 and resend.
>
>        Arnd
