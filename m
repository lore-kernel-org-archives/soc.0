Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE15C433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 14:32:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E615861363; Thu,  1 Apr 2021 14:32:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BEDFC61361;
	Thu,  1 Apr 2021 14:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617287548;
	bh=EnuJEdIT/dhT7DPVhNr4lb17KIMkN7gkBZu5ugjzyBs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=lQG4s3bkFG2/UvCvrJuqbFr1ZNRKzpP5P+znFFgQXLRkfWEiCQYCKzfcIKsM7ch56
	 SghlJ/uCyGawQl3Zip9bO6u9cRrUDcIndcoCQnvZDI8G0wEXFtG3esAQ/T6qJJ37uU
	 SbFoFd6NMUqVfgsieqPz8NEeFJ+Nxi8EceRsbBskwidbm+BuABboZ/QT8xJ7uD4M6S
	 WtZGQv5Ka1sjJWeq0aEGFalAc4HwRizYYKVI/sqz3FCOP8L5gjZkIHtS06pxDiV8za
	 IeVQs6rauEJDMgQ07LsQ2MrXhtJCKVEsawfgv5ttzj2DK0Q5qfblWP/zlN6AE2mGER
	 FqR0+IGVJTpyw==
Received: by mail-oi1-f171.google.com with SMTP id z15so1948562oic.8;
        Thu, 01 Apr 2021 07:32:28 -0700 (PDT)
X-Gm-Message-State: AOAM532UA5CrbXFkerAdzY/XhIcnMr5kdhawVMqNk6iX4g+zt8YRtuJv
	UAxrd8F+pmDmcvbEjBkhoDJYxSu5M0lE8S/wUnM=
X-Google-Smtp-Source: ABdhPJyOvQm7o6N+kRdMeYGZMlli5IM3pj9/2Fx5ibIy32875RvxizlXq5x/VKG7o4eenCGY9iROHKSFkyM4AwT5+QI=
X-Received: by 2002:aca:5945:: with SMTP id n66mr6033019oib.11.1617287548104;
 Thu, 01 Apr 2021 07:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210330082208.GA965793@jade> <161727243793.583633.7984995735453542553.b4-ty@arndb.de>
 <CAHUa44Fdvhj2ca4O+CxD94YZ6BtzNut9HMn3FxDshh_vgHVwDA@mail.gmail.com>
In-Reply-To: <CAHUa44Fdvhj2ca4O+CxD94YZ6BtzNut9HMn3FxDshh_vgHVwDA@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 1 Apr 2021 16:32:11 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1eKs+xkO0JVT38iUn2PJf5KQh0gQ2SuiLeRpMUSmgUrQ@mail.gmail.com>
Message-ID: <CAK8P3a1eKs+xkO0JVT38iUn2PJf5KQh0gQ2SuiLeRpMUSmgUrQ@mail.gmail.com>
Subject: Re: [GIT PULL] OP-TEE tracepoints fix for v5.13
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, 
	OP-TEE TrustedFirmware <op-tee@lists.trustedfirmware.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 1, 2021 at 2:32 PM Jens Wiklander <jens.wiklander@linaro.org> wrote:
> On Thu, Apr 1, 2021 at 12:23 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > merge commit: 3e530f89d72dd1ab31e20d6f8567e357b928705c
>
> OK. Please note that this pulls in 0101947dbcc3 ("tee: optee: add
> invoke_fn tracepoints") (the commit just before actually) which I
> believe was queued for v5.13.

Of course, that explains it. I'll take it out of the fixes branch again then
and apply it on top of the original merge in the drivers branch instead.

Thanks for the clarification!

         Arnd
