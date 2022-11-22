Return-Path: <SRS0=l5Fe=3W=dabbelt.com=palmer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CC9C433FE
	for <soc@archiver.kernel.org>; Tue, 22 Nov 2022 15:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 46068C433C1; Tue, 22 Nov 2022 15:00:03 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51D68C4347C
	for <soc@kernel.org>; Tue, 22 Nov 2022 15:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 51D68C4347C
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pf1-f182.google.com with SMTP id 130so14580132pfu.8
        for <soc@kernel.org>; Tue, 22 Nov 2022 07:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8Tw5fHcTZzbSzK7WDa8C+XaUgJaXo0qN5pr/H7EMQA=;
        b=kkmL/Pp+l8cRUF1T+0CM/AEUlrcG+6/tnZorn1meU+SYKYzMtn4tE9qzuJlXl2024P
         sQ/PQqLJdNLjfUueWVQlNXIYFQ72gaWL+OfYfPelScZtSMZzAJv/0SOtLgc9jZKY4BK6
         9uaJf555bvV21mMCVLCe2NIPRzmrmtmZ9AKvkPvKXMSw1v8HguNO+OIghconMdmcSPr9
         6Kk//ml9VJGdhD4bVtDXELzl6unlUzBrhZ48U23buoFzxKvfUvcHIvMZl7UJw3ImuX17
         sI5RCLbI4XzvHmIvs7E8aSUAyfELUXhhy95CLKev0YRrNdDVvZ4NNxbdW/yB8USTVRrd
         PrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8Tw5fHcTZzbSzK7WDa8C+XaUgJaXo0qN5pr/H7EMQA=;
        b=38bCdYw/VDdHOkd8CZAfsPnvC/7evKWQexS1HdN3waCky6uPNDPbfWgeH7cjWIgSPN
         Qv5+b20In9tbo0GzrH44z6Q/DI2Xz2e3IrDWKqVp2BIXAasuYM6/cBtl1dry7wYhF5yp
         nH4adDaEY2wbtjELnG1LCl/t9ERheCuHNe+enNbevKzGGfYfRLjMTAHq2f8JbfzywhBX
         k1vuvtbsFCGEas1uhhAHudhnFf2VC7qfkFDgTMJB+y2xWpHv3omyIjrtpOkMvHGqizIm
         /4q4qtZRHWv/WHDUJNgDOJih5CfBB+NLDhoLxHc0Ay9T/JMZL/1HwHyFUmucVk/UeiQI
         rL7A==
X-Gm-Message-State: ANoB5pli0bfGsKH+hURrO76sCse39wp2zJGsityX4k/YS7YmRShOCbBi
	x9ryyfQ66NaMxVUD0TyDc7GQpg==
X-Google-Smtp-Source: AA0mqf4037s5rz87VCZs9Uvr65SLGN1v/kc7w9QZZgbAlTMorOm/8jwJ+IHL+EDqUCDDg1jTnyj0sw==
X-Received: by 2002:a63:485a:0:b0:45b:f8be:7402 with SMTP id x26-20020a63485a000000b0045bf8be7402mr4655631pgk.484.1669129200511;
        Tue, 22 Nov 2022 07:00:00 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id 23-20020a17090a0a9700b002182cd64b1csm12376501pjw.1.2022.11.22.06.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 07:00:00 -0800 (PST)
Date: Tue, 22 Nov 2022 07:00:00 -0800 (PST)
X-Google-Original-Date: Tue, 22 Nov 2022 06:59:58 PST (-0800)
Subject:     Re: RISC-V SoC Drivers for v6.2
In-Reply-To: <608037ab-1e9c-4f70-b85c-5665a4bb1769@app.fastmail.com>
List-Id: <soc.lore.kernel.org>
CC: Conor Dooley <conor@kernel.org>, soc@kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-3945534f-98a0-453a-8a1b-3e1c8f3441a4@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, 22 Nov 2022 06:38:40 PST (-0800), Arnd Bergmann wrote:
> On Mon, Nov 21, 2022, at 18:24, Conor Dooley wrote:
>> Hey Arnd,
>>
>> Same stuff applies here: lmk if there's something you'd rather see changed.
>> Perhaps you'd prefer to see PRs per vendor? Although I think that's less
>> likely to matter here than in the DT stuff. Again, I'll try to get the PR
>> out a bit earlier next time.
>
> Applied, this looks fine, just a few things to keep in mind:

Thanks!

> - please add "[GIT PULL]" to the subject line of the email

FWIW, here's the script I use to send pull requests: https://github.com/palmer-dabbelt/home/blob/master/.local/src/git-send-pull.bash

> - Splitting up a large pull request into smaller ones can be
>   helpful to make sure things don't go in unnoticed. I try to
>   (briefly) look at each patch, but if you have 20 boring but
>   large patches, and a small but important patch that I may
>   need to comment on, that is a good reason to split.
>
>> Not too much to see here, Yang Yingliang has added some error handling
>> to the setup of the driver that reports SiFive cache topology
>> information. I've put it on -next given how far we are in the release
>> cycle, feel free to put it on fixes if you disagree :)
>
> This is fine either way, as none of the fixes are likely to cause
> any real issues. I usually like to err on the side of having too much
> in the fixes branch instead of risking to miss something, but I'm
> just as happy to follow your preference here.
>
>> RISC-V SoC drivers for v6.2
>>
>> SiFive:
>> - add probe error handling to the ccache driver
>
> Since this tag description becomes part of the git history, try to write
> it like you would write a commit log in the future. Ideally that
> avoids bulleted lists (I know they are easy) and instead uses full
> sentences that explain things about the state of the patches. If there
> are bugfixes, are users likely to need the fixes or were they found
> through inspection? For new features, explain who would have the
> corresponding hardware and what it does. Again, what you have here
> is not wrong, but it can always get better.
>
>       Arnd
