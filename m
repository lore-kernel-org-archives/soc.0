Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E244CC00144
	for <soc@archiver.kernel.org>; Fri, 29 Jul 2022 16:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4EBAC433D6; Fri, 29 Jul 2022 16:15:53 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A16CBC433D7
	for <soc@kernel.org>; Fri, 29 Jul 2022 16:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A16CBC433D7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f42.google.com with SMTP id p5so6378313edi.12
        for <soc@kernel.org>; Fri, 29 Jul 2022 09:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=xSDRKdty0wVkW61wac2qSe+OPKhy9z0shDqzar+oq7Q=;
        b=ASxKkckqlu689PUm9aVQf4rXt8iNyNs0+RXS5aXwLWKCu4pMOA4Y2sVVoWd/6zslku
         dlqNFhWRzrGRPKULDttldYsRGokq2bQCOR6wu9chv46+t0/kYHLZVnqhZQiaGXt7Gi+u
         N8ZCSg4QxeAxsVo9W8UEWgGRptHIaQMcp7Z7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=xSDRKdty0wVkW61wac2qSe+OPKhy9z0shDqzar+oq7Q=;
        b=x+kYd+IprYD7fefm8gm46NHHXK/qc3hjMY7zt4B8JAuZgCtnPnnzjl09z/rvCuEmNh
         W5pPuVNOWJesQexMj9gv6RfJsjtL4oULdC0pN9BPtMNpESDu5BX+laOdcAMEQXZMERuI
         7zMyUYwZX8K4Tsdmxr8TYBHbWtRaloFKJcB2ITJg2/9LbBLIYE6ree4gAZ7R5LeHAwHb
         dadSOoYgD8ncNL+Hzn4KU17Z8A/SqD9Ns7HBnNYz9rpL4fczJoRSjRr4WtySHBHGfMel
         SIXpNnw/LZVxxBpFonS9ZLtUpNEN1FD7LUTGi/UzQHpEaNjVZyBzyP8bdiNq22lE5c8B
         PhXw==
X-Gm-Message-State: AJIora9/Zf3YM/Rhx7CcnYNOjgwha3vVC0OuHyrFuogBGlqV//0QdeDY
	W32fD9xM5nzoUCFM+llZRq/92mPRBLQ0Q4wL
X-Google-Smtp-Source: AGRyM1sTmwIhJI/yikcgVI6rAw58hz8l1WMLJjHqZ1fkvwM9ekovTKw7PumJ16Gl1F9sy19dt4ruCA==
X-Received: by 2002:a05:6402:25c6:b0:43b:7797:d953 with SMTP id x6-20020a05640225c600b0043b7797d953mr4318506edb.254.1659111350050;
        Fri, 29 Jul 2022 09:15:50 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id kx6-20020a170907774600b00724261b592esm1859005ejc.186.2022.07.29.09.15.47
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Jul 2022 09:15:47 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id v17so6560376wrr.10
        for <soc@kernel.org>; Fri, 29 Jul 2022 09:15:47 -0700 (PDT)
X-Received: by 2002:adf:edcb:0:b0:21e:d043:d271 with SMTP id
 v11-20020adfedcb000000b0021ed043d271mr2960016wro.274.1659111347424; Fri, 29
 Jul 2022 09:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a3GTzeJUdcjVv-1fL7h7e6XRFPA65-5xseQ4=tyZE8UDg@mail.gmail.com>
 <CAHk-=wgdnnAmDopTKXbS5u3Ty8GgAfuFOSOycsCfe6pSAqunHg@mail.gmail.com> <CAK8P3a0L24AxQD_72bHYY7CKvnvcYi4e_+Zq_n6KqWXzD7-G9g@mail.gmail.com>
In-Reply-To: <CAK8P3a0L24AxQD_72bHYY7CKvnvcYi4e_+Zq_n6KqWXzD7-G9g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 29 Jul 2022 09:15:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjPm7q4ikoErhEn3dgGsO_-RSyYuRYox2oHp+Z0z8FUGA@mail.gmail.com>
Message-ID: <CAHk-=wjPm7q4ikoErhEn3dgGsO_-RSyYuRYox2oHp+Z0z8FUGA@mail.gmail.com>
Subject: Re: [GIT PULL 0/6] SoC branches for 5.20
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 29, 2022 at 12:15 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Fri, Jul 29, 2022 at 1:15 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > Hmm. I'm missing 2/6. I don't see it on lore either, so I don't think
> > the problem is on my end..
>
> I got a reject from the mailing list because of the size limit, not sure why you
> didn't get it though. Sent a smaller version of the email now.

You resent 3/6. Which I had.

It's 2/6 that I'm missing.

                  Linus
