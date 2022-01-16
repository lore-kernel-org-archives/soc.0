Return-Path: <SRS0=5Zx1=SA=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80546C433F5
	for <soc@archiver.kernel.org>; Sun, 16 Jan 2022 12:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5217AC36AF2; Sun, 16 Jan 2022 12:09:19 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B2CADC36AE7
	for <soc@kernel.org>; Sun, 16 Jan 2022 12:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B2CADC36AE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f51.google.com with SMTP id z25-20020a0568301db900b005946f536d85so7194525oti.9
        for <soc@kernel.org>; Sun, 16 Jan 2022 04:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nzQepfLL+SGjYE7/8X4gZEz0wVEIHbxydae1Vjcfelg=;
        b=li4eNDHzmKQPKXQH9EPaZqkg3ZKafq+S1WNXBl3larEL7wbJLhx1iOgVLhJe5+whhW
         OIrZ2I4haacmN/3uAP8Z+Mut0w9Vhfkw5m1nPc99SKrZTx1xG0aoJVm/cLQ3e87lnZ5M
         sNCasYAPmabIQgdb0WZwoqslm11l0s1jXFEw6SKs5pOw3tQqNWEKaBX4RpyoBe+AqTd6
         2RHoNLI7t35r9z+5UZLLqSSRJQh45vK+9aQ+DI/ws9+dDnPEkYnr6yh9EhwPcSc4S/jR
         ZGbrEdSUbUFFEC1IWfPqt5VozKeCJopfPE0wZWxmyE57gHz7LD+3WoOKDdEaGZe4Avfg
         +/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nzQepfLL+SGjYE7/8X4gZEz0wVEIHbxydae1Vjcfelg=;
        b=ND3fkQb2tMwIpcKAPV+64wmAlo9mdla4bWZWrQeMD87dvLZ2a8hZoDwbV6PDDBAXBr
         Jyl+c6QBvrYHiW2W/+017wrFljgzMPvLsSiKeEBcqvTE03m/8W6F7g07bb+AR5ItgIgs
         VJa0LNj3U7m9oUKIhRTy+R3MfUgeZQT942hhOmbFNQHl1inqngctBwu4geAioffswu0v
         fxntMx8EG88SjzVWxKidDF8G5g7ZCJxy+JavrzXTkZbmUKqXwLmBHYR1kJK7muk94K7m
         FHyCr5WodQ0vykwsUnDfaZ2Ho5ySM0QdtYK7G2gTdR7pBOlGHMBTdEKija1RB0r7w0s8
         Y/Pw==
X-Gm-Message-State: AOAM531nZZE3zuo1eot9mIl3aBt/5xT3/3dK12fD4+mQVsRz8WSirTrl
	schLh1v8OYI4i8NK0eaNl5mIJa+MkoDziklMJjt4sA==
X-Google-Smtp-Source: ABdhPJwa04h4sD14vv2Z/CGZajhxLfFbKVOadbmybRdvY888f4W2fEZ/uIH7hFe02AlyoMGqWsll6X2tNHCd6NvGZqo=
X-Received: by 2002:a05:6830:4:: with SMTP id c4mr1427187otp.237.1642334957532;
 Sun, 16 Jan 2022 04:09:17 -0800 (PST)
MIME-Version: 1.0
References: <CGME20220113122404epcas5p4aa1c3ac09510eb55cce5fdd0791993a6@epcas5p4.samsung.com>
 <20220113121143.22280-1-alim.akhtar@samsung.com> <20220113121143.22280-13-alim.akhtar@samsung.com>
In-Reply-To: <20220113121143.22280-13-alim.akhtar@samsung.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 16 Jan 2022 13:09:05 +0100
Message-ID: <CACRpkdZkc9ShabhKoVnXMfQp3M7siYUYirBFVBP8y3dLEw5azA@mail.gmail.com>
Subject: Re: [PATCH 12/23] dt-bindings: add vendor prefix for Tesla
To: Alim Akhtar <alim.akhtar@samsung.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	olof@lixom.net, catalin.marinas@arm.com, robh+dt@kernel.org, 
	krzysztof.kozlowski@canonical.com, s.nawrocki@samsung.com, 
	linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com, 
	linux-fsd@tesla.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 13, 2022 at 1:24 PM Alim Akhtar <alim.akhtar@samsung.com> wrote:

> Add vendor prefix for the Tesla (https://www.tesla.com)
>
> Cc: linux-fsd@tesla.com
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>

That's an interesting new SoC vendor...
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
