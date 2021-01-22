Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64844C433E0
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 14:25:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 31B6F23A56; Fri, 22 Jan 2021 14:25:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0757323A03;
	Fri, 22 Jan 2021 14:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611325554;
	bh=u9xcNnPyg7RGW5nKJoXPv88a/XmY2Ybx+0rjEWtgATQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=AYbx0Bj7he3vZjzB9qnO2kohe7BfnEeXc45Yftv86sxynb/GPDyFblMxOegAZeaqa
	 b4qB3uRhOkZlb78F9UgbKhZOiEkSyY522WwPwYI/UHJ8v+3jxs8VaMv9sB7kL9PpKj
	 uFrPZp6deF5m530D+e37QwE6ztdaYcRRx3dZkCYoVLJrtqXgKpMFDS8hRjEpAnOBIF
	 ez+NHMxHLg77fJdfiaaTNBaxDEC1F9V1V3msWGdBfIVL9ECEzVymwjNQE1PseVLKFe
	 E6YtxOqhMjeKf+cN72UwZ3twQDc1EKUerCOHvhaNtCeIbspUhSUkHdATmRGHAK4fDg
	 3EaotfPWEXYeg==
Received: by mail-oi1-f169.google.com with SMTP id j25so712008oii.0;
        Fri, 22 Jan 2021 06:25:53 -0800 (PST)
X-Gm-Message-State: AOAM531HruqZesFkY9a7VFnx9GgPMD0vNdpn6+tsMB1J2jG3Hxw43gb0
	uWD/DB/olvXpHQd6PQRZAL0XqBX14FgI9LemNzI=
X-Google-Smtp-Source: ABdhPJzNGAyK2TJpCo3unZBUgzlN6iXJFnyReJoEEfqtxFSPiKvKoeZsRbglzfuLdLjMu2vOLQwahrQvj5yuMHiF+2U=
X-Received: by 2002:aca:e103:: with SMTP id y3mr3293241oig.11.1611325553238;
 Fri, 22 Jan 2021 06:25:53 -0800 (PST)
MIME-Version: 1.0
References: <20210122074234.GA1074747@jade>
In-Reply-To: <20210122074234.GA1074747@jade>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 22 Jan 2021 15:25:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a12gaDHLTrayEuWp5gkDK8EyMOZDH+Zd3fgMHi7=KOaVQ@mail.gmail.com>
Message-ID: <CAK8P3a12gaDHLTrayEuWp5gkDK8EyMOZDH+Zd3fgMHi7=KOaVQ@mail.gmail.com>
Subject: Re: [GIT PULL] OP-TEE driver fix for v5.11
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, op-tee@lists.trustedfirmware.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Rouven Czerwinski <r.czerwinski@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 22, 2021 at 8:42 AM Jens Wiklander
<jens.wiklander@linaro.org> wrote:
> for you to fetch changes up to dcb3b06d9c34f33a249f65c08805461fb0c4325b:
>
>   tee: optee: replace might_sleep with cond_resched (2021-01-21 10:36:48 +0100)
>
> ----------------------------------------------------------------
> Fix rcu_sched trace from OP-TEE invoke
>
> Replaces might_sleep() with a conditional call to cond_resched()
> in order to avoid the rcu_sched trace in some corner cases.

Hi Rouven,

The bugfix looks correct in the sense that it fixes the issue, but
it took me a while to understand what you actually try to do here
because of the unusual way it's written as

              if (need_resched())
                          cond_resched();

which /looks/ like you are doing something fishy here. In the
end I concluded that this was probably just a misunderstanding
of what cond_resched() does.

Can you replace it with a normal

       cond_resched()

without the second need_resched() check and make sure this
still works? cond_resched() by definition performs the check
to ensure that rescheduling is needed, so unless you want to
explicitly hide the might_sleep() in it from being seen, it's
better to call that.

        Arnd
