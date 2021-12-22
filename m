Return-Path: <SRS0=JomN=RH=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738ADC433EF
	for <soc@archiver.kernel.org>; Wed, 22 Dec 2021 02:16:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D97BC36AEB; Wed, 22 Dec 2021 02:16:33 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CB90DC36AE8
	for <soc@kernel.org>; Wed, 22 Dec 2021 02:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CB90DC36AE8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f179.google.com with SMTP id bj13so1688999oib.4
        for <soc@kernel.org>; Tue, 21 Dec 2021 18:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TjvSc6Zc+phiwllv9IBUiUWQ+4eYlzKIjbFvpbNL+r0=;
        b=W+tvuM/1MFvZJZ9ZafbDYJu8HqtyQA3TB2JNiXiRXlaYEY4alQSki7xDIF/FvRMHOf
         lZWRjnaMueYhqE7/1bk6mDTjMlRmQZK/C2GLYaaHUhIuKFarJdVLqJYADJ4wU3mgU9/U
         TfmfIobvYOFKcm6LEfXy7EyUMWMXsjOEpJ+6712KkGOuzcJV4Grw4N4vviZ97Fd3ubEy
         j7LTyp4hQqWazdagNLbVQxQ7ov6OBxfo4+lZiYylI8NWSigwxdVHHWLghvCY1vQ+TSM5
         lRjqj3br36pUrWkgQCgOMEP6aNi3PSZtd0kHed7uqn3vffZLmJrV25lUMGg8PSVZUmmW
         TbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TjvSc6Zc+phiwllv9IBUiUWQ+4eYlzKIjbFvpbNL+r0=;
        b=v6mgVmZavTa3riDS91f7hu2KXQrYPe+yMeowNOtVYSe7WZwnqQFU+KqnDNNU0Qg+oA
         UoVdQ5HgNgsTMb915VNhph0nNyikm0xvCzuFs/S6VnVPXX7Ka0gvCBh+/Xan/D2hdexW
         Or5/nqvY6aDro9W41HWFobe473OZEa0LGXCzd5lRyfM0G66XEZ+Ul3978s7p3SDx6Ss9
         ZnKCYCEthYNElUE3h1yPSf12Wg3Uiy+QoY2mASQ4sNb48Al9mW8S3adMDwHdBZMu/oMb
         Q0S7o1bZ76YJbNxttJvLL9QjCQNB2Iyf+plnspyLFFizX/7gk48KlpLRel79IkBxJunZ
         QSYw==
X-Gm-Message-State: AOAM530OgEJEbldeqHQAegxiRq+vPtTIU8TZvvlCij0/CCFglRVelcGr
	lM0fvnX0o2qGX+IKvoapZg+ILKaz0FweSAMjZDpWLA==
X-Google-Smtp-Source: ABdhPJxcTE0tRvTBllqs3cr0F9sO0zZeXMvsl/bZflqBg+hsNfi88xkWkosuNmr2F7f9aKL6ThDkerca0MXJcliVCvc=
X-Received: by 2002:aca:5a87:: with SMTP id o129mr728405oib.114.1640139391889;
 Tue, 21 Dec 2021 18:16:31 -0800 (PST)
MIME-Version: 1.0
References: <20211220062406.108789-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20211220062406.108789-1-yang.lee@linux.alibaba.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 22 Dec 2021 03:16:20 +0100
Message-ID: <CACRpkdbfJY=NKgZ3GcNG9QqrFpCkQpXMmLcWJ20EcPuQ6WfVdA@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: starfive: remove unneeded semicolon
To: Yang Li <yang.lee@linux.alibaba.com>
List-Id: <soc.lore.kernel.org>
Cc: kernel@esmil.dk, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abaci Robot <abaci@linux.alibaba.com>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 20, 2021 at 7:24 AM Yang Li <yang.lee@linux.alibaba.com> wrote:

> Eliminate the following coccicheck warning:
> ./drivers/pinctrl/pinctrl-starfive.c:1029:2-3: Unneeded semicolon
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

This patch is not in the pinctrl tree, I guess it is in the SoC
tree and need to be applied there.

Yours,
Linus Walleij
