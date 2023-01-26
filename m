Return-Path: <SRS0=gAO4=5X=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E6DC05027
	for <soc@archiver.kernel.org>; Thu, 26 Jan 2023 20:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 85EE9C4339B; Thu, 26 Jan 2023 20:07:42 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 643FBC433EF
	for <soc@kernel.org>; Thu, 26 Jan 2023 20:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 643FBC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id d8so1491061ybe.9
        for <soc@kernel.org>; Thu, 26 Jan 2023 12:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FLvduNoOt8LztTYVpuNMVnPelMmnqyRxqRLyg6HGxcg=;
        b=H+6SnUs6VnnGPZqMii9E04B2jZbdPO8JEzKwKb/AJ8KxiwwnK2MNII3exjLOSl5gid
         77VoL20WxdjPiAd6mM/Frt++DnvRBGeYkCnMZxJPaMaSvtgB/RUnrDdxLVgKkeveSvqV
         LrzyjFLEy9Ju1waaH1L59m7AUNdOGsFP/ugRIHnpl2AenIYyj6LEgFSvN6LFq6cNKlEq
         E2X18z1uBxOTst1xMvqGuCwKxTd4bVYXZAD93G/mIzNmkdajWluOkGUV1vYYnY3i2Fdw
         fllbaK801dFQ1i7INkpwSx52GZBr7tIxG6tWtQsCZln8/tPnjiETmnRpLougqogGIAL/
         B/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLvduNoOt8LztTYVpuNMVnPelMmnqyRxqRLyg6HGxcg=;
        b=1hhXtik11vaYNMVIeW6w7x+ep9aNI0VZcSt2IsfDjfLh0jdhRAm/VL/0zkjq8/qev1
         IqCCfAI9rmpG2vla7ELwbcth32SsLYy0qtyMgcIQGhZmd9weDT/LIMMj1fBqINhQt1eY
         qFU3Cli2rKOGNCQnmwTV7oi2tDOEJL/AfP9w1BmjsSicJ9JPb1RfheR8CTrUbIp2KUsS
         zOCF2ERvJotFtvUTWAvBlz47yZ/F/xr6ce2wzrweFyyHKs23AuiJseOjMVfdTnaH0GoC
         h9eIteszm2o7l4duagZsbKAOm32qFvRrJQ1OvwtxiLBUke48e8uuByt5WjDg8dxXU4Ur
         oAVA==
X-Gm-Message-State: AO0yUKVXfRaa7dkEPnI7espAq52USGSUlvvq1HpJ+15iyY4TRTSP45x2
	ejhLjqMuWQadtYAaVbVzBWeQSgUCHFiOU6HK+pXJVg==
X-Google-Smtp-Source: AK7set+RXU546bCG2ieA1RNematBemc4AFyAycDDxbMQYNdnjp7iUSmTGAk1mBuk641lDSfvZ/bqCOrkZeydPqsG8fw=
X-Received: by 2002:a25:f81b:0:b0:80b:821f:b621 with SMTP id
 u27-20020a25f81b000000b0080b821fb621mr881734ybd.24.1674763659341; Thu, 26 Jan
 2023 12:07:39 -0800 (PST)
MIME-Version: 1.0
References: <20221226123630.6515-1-pali@kernel.org> <db008af4-2918-4458-aa68-2392674475c8@app.fastmail.com>
 <Y8rMJcX0cqThKj2N@google.com>
In-Reply-To: <Y8rMJcX0cqThKj2N@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 26 Jan 2023 21:07:27 +0100
Message-ID: <CACRpkdZrL3Wpk6_Pka_Ye-9C0Ewx5ULZ8pt396kO-e95kqku_A@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/8] Resend LED patches
To: Lee Jones <lee@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	soc@kernel.org, linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, 
	linux-leds@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 20, 2023 at 6:15 PM Lee Jones <lee@kernel.org> wrote:

> If everyone is convinced that applying these drivers is the correct
> thing to do, I'd be happy to (rather) take them via LEDs.

Oh you are co-maintainer of the LED subsystem since a month!

Sadly this series stalled way before that, so that's why we didn't notice.

By all means, pick it up!

Yours,
Linus Walleij
