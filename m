Return-Path: <SRS0=gAO4=5X=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3095C54E94
	for <soc@archiver.kernel.org>; Thu, 26 Jan 2023 09:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B8AB7C4339C; Thu, 26 Jan 2023 09:20:36 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CE1EDC4339B
	for <soc@kernel.org>; Thu, 26 Jan 2023 09:20:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CE1EDC4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id d132so1265223ybb.5
        for <soc@kernel.org>; Thu, 26 Jan 2023 01:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PIKEvOOg7TxzJsXrhjVfUqlDl2sn+UZTz4Rc3TrrEIg=;
        b=EU+lbcT2YXVKDKLTzTc9xoNHdYMHEY4ls1ny1gl0zY48FTpW//8jI3QofPN0sWDSAS
         TvtLp78RSPzqsf5RjNoCQYwbDOeTM9mxYnvI5jWNNhec9eXnpZFy41PH9wQ7cvRRM9vg
         OAlxEBnZhYSf8BivgEDC1fEi/f3vDVIWR8F2KUdI4iF9ck2gZFprXs0aWRLzkOA1SZJw
         2A4YryUL68LaCAn4yjMY37H6mar2QGcXvk4sXKngcET1iY3lqGllb8PQQcQp0HqZlwu4
         TFpU1QiOnhB+2/1m/mq9zalQNvR5tAVWPYkgk+9BZ6d0Mj6UvI0SslJsab0xUpjKTlYG
         7aaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PIKEvOOg7TxzJsXrhjVfUqlDl2sn+UZTz4Rc3TrrEIg=;
        b=Ll1GHYRmgEayA5pszEOilkCvhfLsFJ/x/T3+OplALCVLqJ3h1PaU4jLCouUX7HvmjK
         U2ik3lt1rDBlcow74yRjMKpZ9q7TTWtInVKD/fUSZ0Lay9hF6UmfMtL9q9SivIGYO3B8
         t+UQK4/p43yK0XwgGROgAqCy/d93AxiC0dLOw8lZa8K79uhbaX2+30AnLk93IVKfHRM0
         ZuWw3q1fSbZSVZ0Hog6AN8JvEh4hQQToM1wQsuPSF40/BsLeHOu6Yu45pyg6ktMKuO5t
         DOvLHIS6lUkcjZDkMPHXeIfEXfy33YQrm0fX1hvX/jZAMysUMzTTzi9ymnntqkmuj0OH
         GSHA==
X-Gm-Message-State: AO0yUKVvn32DJ4H0F86YPsgc4QgbpwvKONSteS9al+DTgwbNr6Ui6yU5
	l3ep5gncDajQJ5oTcrVEjVaM2EwTcTgA1w/7kPORxg==
X-Google-Smtp-Source: AK7set8m/Xg0MJ7/99ZvKeG68+dkRAlcmiiG+bqKuRQ0G4YH4PseVSz70LckNk7ZIgH2jjYRjY0X7CiCw7kAATCj9G4=
X-Received: by 2002:a25:d1d1:0:b0:80b:4d84:b25 with SMTP id
 i200-20020a25d1d1000000b0080b4d840b25mr953646ybg.584.1674724834790; Thu, 26
 Jan 2023 01:20:34 -0800 (PST)
MIME-Version: 1.0
References: <CACRpkdY24Lv0F3ct2R6ALPpAdxWz_vEjrPAGNSF3pcoOj-Xqcg@mail.gmail.com>
 <CACRpkdZVH8nu=4a4MuQZ=uUpqg1MBXShCU_Bm3CUxPg1adO8BA@mail.gmail.com> <6b53a127-4529-4283-be4e-1724de98fd37@app.fastmail.com>
In-Reply-To: <6b53a127-4529-4283-be4e-1724de98fd37@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 26 Jan 2023 10:20:23 +0100
Message-ID: <CACRpkdbXhkyfDScawebq0g-xc03OPS8aPaRWnzbA2pXZ+ahZ_A@mail.gmail.com>
Subject: Re: [GIT PULL] Ux500 DTS updates
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, arm <arm@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 26, 2023 at 10:09 AM Arnd Bergmann <arnd@arndb.de> wrote:

> I pulled it manually, but if you notice something like
> this again, it's better if you follow up with a v2 pull
> request. Patchwork should notice this and mark the first
> version as superseded in this case.

Hm yeah I did that before actually it works fine, just didn't think
about it...

Thanks for pulling!

Yours,
Linus Walleij
