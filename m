Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792809480;
	b=kX1BwXQE1ruT6z0QLk3sAhx4x5R85u+ovv0V1w+T+CnLiJ0PK/0IYdvtlsRqnCme7JGX
	 5lzuKXhfF1RKhQxYzGXgSv6ciYvl9frTB6vrf2fYYEmja+KORWynX2z0cwg6Gy+wopzYF
	 LGI7+0VJ7FDrXmcGrLsORHCR3CPYgH5RS40qz8ta52vi80f4/B8O89nGS4Ihkw3Y8drXt
	 cdaGJ/A6ngM1bOVdq/8q0yZkMzMx+6CxbTOLb0O2CkUUvx7MZCLDW5KogeJh4Lt+30Ex4
	 Yb6lTcO8nVsiE8KF4ulF4HibyDa8ZL/VOV+cIFuIPw4hg3qL/MaBjDef3bNsH70cF7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792809480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4aeP3BkhskeN4vpePbdVXng4dknkyS1fsNJYB/+44kg=;
	b=ZITuOtlpx+XsffgQRA2LQk1fUUf3GTQly1wIL0HW97Gcd2G8WiLpoPdbQ7lGXwGCAxHF
	 9UHpnhmWnqOucH1rDkm+fg23+8FMePvGS9zE4IvcZV+RVFaogsURnrjOXNKEO7cTmoZfM
	 ekvCVxxOlu/+COIU03zQWy5WbaZGDrDT5QawqnFMixfr5CxUGLD7R+mwGyiS35xuemhlU
	 JjMSTtubhILJzwz1AheqVVSJrCO7p+DrDqsbodnPyHmmRpRM/7NGvsCHP+xiCDbWcYkFV
	 CL7YCU9OWi4dm8eyfPGxXQWRzaeqPcVfDclWyQbyAZlERvvsj6nKQ8PZAj1bi5xdyBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W+fPEw9I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F8F606A31A
	for <soc@lists.linux.dev>; Sat, 24 Oct 2026 02:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2F8F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W+fPEw9I
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso219208866b.3
        for <soc@lists.linux.dev>; Fri, 23 Oct 2026 19:37:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792809478; cv=none;
        d=google.com; s=arc-20260327;
        b=de9Ab0QvTU0LoMhkTEltRwmUifsdygzAcl9GU5VHfodlG4UFokWQjOsSFDFJDuDZmD
         leL+FeVsNfthaqhHQMui8ijtw4H7/DztLSksEsWxB3ijtyUkZo6uEE5QYJPUEwX+9gPE
         /fQk2fPQcDXZQ/yRwYLGex/EedGQUqI3+sEg/BspXcbG+41du1vcmKr4b0umCdU83LHk
         +9GVUvY9Su5B3C//q7b795aR0jT256GDBpGZottZQiUfoA6orTkXbxHhhgm1jLTUU+Jn
         NTUyz3bdvy60YCG2bRag1xxLG48stl9uJjj14gPreK9bhCldb6w0d2tXCsXcplc24KPd
         dpqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4aeP3BkhskeN4vpePbdVXng4dknkyS1fsNJYB/+44kg=;
        fh=Yh881X94Efawx3Knfw/wIAEYmR6HlrGUQmNmvjgiu/k=;
        b=FQazG9EF3qlVrTy8eOP7qye9gHs23lbQc8mF2HYbopSmQV5oGF0puiBKSrH1l8ZGmR
         gaZV9xPTKNYaIZzP8j/GJ7WSuyh5BYt6ICGnpA+6prlFUK5bRGbddF08Ww4QPDPPhOLv
         KeN0ZO7+ekE+GUS43+b8K7MIXJfv9wVSG1bY/+IPqCWon8NnOgDk4uF+vq/o/xyPrqZg
         KgelLVB02KlXVLYW3y3llqc0Go8++jiXcxV/juKRh1B+4jM4Ec5OjBAVd/KIhNtdyds/
         I8AtySznQwAyuF5x0lwZwX7QtoO/3iVu8OXmlmkICWhP2lWqchpHd2z9dzMd92QBKwhy
         +vNA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792809478; x=1793414278; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4aeP3BkhskeN4vpePbdVXng4dknkyS1fsNJYB/+44kg=;
        b=W+fPEw9I/4sLTiS9Yqf5hcix34ycinSD0ARrJEOVOHyjhdjbhpKvX1aVsuD2VK5pqU
         xPIJuPRaYAkzNWG0z4wJ2+Vpwm9Pja3BD02k2m0Bs5wnGtuA6uH/JY8r5o7wDsHotcaZ
         cGDiS0pZ5xFVdJc4ykMdO9TAdTqWZTIxlSyvcJakNssCnPpyE2lHwrDzGOkVVZNiW0qd
         um2KNNJV5Zy8hUrAl3T1RCSB69tfVcxfBoZtfDoTMaDft4MydCPEiv9wjMquzK/Mka3d
         MU2IhPlTsgSJAlXbBrOjlqARooLfPXgVdv+7v8xwJCBoiw2Pfihn7w7MpkSyQX7g/5x4
         B1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792809478; x=1793414278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4aeP3BkhskeN4vpePbdVXng4dknkyS1fsNJYB/+44kg=;
        b=hP2WNagoO1BkQ7VPh1/3PVfdmV/9MWBEnHS8c3M/DkpbTwnkzcL8cGk6g8JZSTNI6R
         itbmFT/8r/+EURUWkXNEWt0FZIMTPrWpzrX/DCVIt28ikfFT3qSvjSTKde94wRkFZ6mm
         0Whhg1cp2lYNo6Q0eIME3seeHhCqPdVztY1q+JV9yggAvIoqAngjQ5boex64apIH/nWR
         wwvTlTm+tGZLojRCoRVJ/i6lkVchmxphomwaq5Wm3U9yDbAatjg48tBp/dVCl7MTmdu0
         NuMHMCuiYbdiM+PQzfWFhx4agy1w8sm0Qi9Oo9dY2fymqtOFI7Y1DuEm3GyPrlHHJvr4
         rcHg==
X-Forwarded-Encrypted: i=1; AKwUvBxCmksBI3ZumTCj4oU+v0Qsfas7oZ9slissoXKpGOytEs8iCSWmj+WhCq/LpbBH0DnZ//Q=@lists.linux.dev
X-Gm-Message-State: AFq9FYKHgBXSLgcpH0NdFIXdHQ36aiwRJ6gzDxbFJw928lTquCHz5p9P
	+KZhCPCsKm2GoeTw13MKKudVVSP9WvapUtd6U4l7FOK1u+Cqn96HmYuQBxG4u1ff0NB21UouKOg
	8FEeIy93ww0rEFN+fiwuM5Z8Vf6wT4Q==
X-Gm-Gg: AYBFou146vQLAvvBwmowXdMJv51C+bmsIoW1tpjk+IysHVYodQAFmPazMPS6iiOQ/bX
	hg0gn7RnwjP/lZV2Nu6Iy6QgJbXHasvjcxpximPGLGsUfkQ2qNpPcsLi7vT/fqmQiFB9Uw9e7Nr
	O3EOmgwwwL4poesZDrDfxpfEXfiCDSb1fElQJY60NdgpXFIMNKw1aN2gnvovfWT2yEW4sZv38Bi
	NaohwLsUdTuS6QMIbfNDoa5HFkKt23phWvodIlkGdh4Z5UaPrilTGG1rCiDlCsD6ULg6+5KShFQ
	VrszAu1UwwMfKxUWCg9pfGMX4epS0+BYAeydxy2bD72Rq1yrB7/oz4Yhyphsdb2pGLwZDNBvf9Q
	PtXVBtfNTJX3wA5UsI80I83aWuvYTWb9fiFz6ZiH/ldP875RocybGl+9eTz8XSXB5ME7Zcgl1fp
	0r1HY7PqFlERSYLuJ57xhjw5k9AFaFsdn2L+sDbbTfgnQiEVlZqg==
X-Received: by 2002:a17:906:9fd0:b0:c2a:b1cc:158d with SMTP id
 a640c23a62f3a-c46bde97dbbmr85486066b.32.1792809478280; Fri, 23 Oct 2026
 19:37:58 -0700 (PDT)
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261016013918.3492835-1-mhun512@gmail.com> <atXYWrNAI5pmyMHD@solitude>
In-Reply-To: <atXYWrNAI5pmyMHD@solitude>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Fri, 23 Oct 2026 22:37:46 -0400
X-Gm-Features: AclHuK8ISi6y0PGRQ1melezhjTDPOEdeAo6Lz8Ja0WFr0Na_5A0mSRW3u1OesuA
Message-ID: <CAGEsz8F1x+nDPe4tAuQENFWfqRCwkSKif_Jn1w3iaqmYJEu8vQ@mail.gmail.com>
Subject: Re: [PATCH] platform: cznic: turris-omnia-mcu: stop button emulation producers
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: linux-kernel@vger.kernel.org, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the Ack.

Agreed that an autodisable helper would be useful. I=E2=80=99ll look into a
separate follow-up, including the impact on existing callers.

2026=EB=85=84 10=EC=9B=94 19=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 5:48, =
Marek Beh=C3=BAn <kabel@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Acked-by: Marek Beh=C3=BAn <kabel@kernel.org>
>
> This makes sense.
>
> But I wonder whether the devm_delayed_work_drop() from devm-helpers.h
> should not be changed to use disable_delayed_work_sync() instead of
> cancel_delayed_work_sync().
>
> In this case the initialization function in devm-helpers should be called
> devm_delayed_work_autodisable() instead of devm_delayed_work_autocancel()=
,
> though.
>
> On Thu, Oct 15, 2026 at 09:39:18PM -0400, Myeonghun Pak wrote:
> > The legacy MCU IRQ thread can requeue button-release emulation work
> > after its managed cleanup has canceled it. Since the IRQ is still activ=
e
> > at that point, the newly queued work can outlive device teardown and
> > access freed MCU state.
> >
> > Use disable_delayed_work_sync() to prevent further queueing and drain
> > the worker before the IRQ action is released. Keep the parent IRQ activ=
e
> > while the worker completes. devm_add_action_or_reset() also drains the
> > work if action registration fails.
> >
> > This issue was identified as part of our ongoing research while
> > reviewing kernel code.
> >
> > Fixes: dfa556e45ae9 ("platform: cznic: turris-omnia-mcu: Add support fo=
r MCU connected GPIOs")
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> >  .../platform/cznic/turris-omnia-mcu-gpio.c    | 31 +++++++++----------
> >  1 file changed, 15 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/platform/cznic/turris-omnia-mcu-gpio.c b/drivers/p=
latform/cznic/turris-omnia-mcu-gpio.c
> > index 4e430d6c3fc4..8f43bfa92373 100644
> > --- a/drivers/platform/cznic/turris-omnia-mcu-gpio.c
> > +++ b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
> > @@ -11,7 +11,6 @@
> >  #include <linux/bug.h>
> >  #include <linux/cleanup.h>
> >  #include <linux/device.h>
> > -#include <linux/devm-helpers.h>
> >  #include <linux/errno.h>
> >  #include <linux/gpio/consumer.h>
> >  #include <linux/gpio/driver.h>
> > @@ -841,6 +840,18 @@ static void button_release_emul_fn(struct work_str=
uct *work)
> >       generic_handle_irq_safe(mcu->client->irq);
> >  }
> >
> > +static void omnia_disable_button_release_work(void *data)
> > +{
> > +     struct delayed_work *work =3D data;
> > +
> > +     /*
> > +      * The IRQ thread may requeue this work while the IRQ remains act=
ive.
> > +      * Disable and drain it before releasing the IRQ action and the M=
CU
> > +      * state used by the worker.
> > +      */
> > +     disable_delayed_work_sync(work);
> > +}
> > +
> >  static void
> >  fill_int_from_sts(unsigned long *rising, unsigned long *falling,
> >                 unsigned long rising_sts, unsigned long falling_sts,
> > @@ -1082,21 +1093,9 @@ int omnia_mcu_register_gpiochip(struct omnia_mcu=
 *mcu)
> >               return dev_err_probe(dev, err, "Cannot request IRQ\n");
> >
> >       if (!new_api) {
> > -             /*
> > -              * The button_release_emul_work has to be initialized bef=
ore the
> > -              * thread is requested, and on driver remove it needs to =
be
> > -              * canceled before the thread is freed. Therefore we can'=
t use
> > -              * devm_delayed_work_autocancel() directly, because the o=
rder
> > -              *   devm_delayed_work_autocancel();
> > -              *   devm_request_threaded_irq();
> > -              * would cause improper release order:
> > -              *   free_irq();
> > -              *   cancel_delayed_work_sync();
> > -              * Instead we first initialize the work above, and only n=
ow
> > -              * after IRQ is requested we add the work devm action.
> > -              */
> > -             err =3D devm_add_action(dev, devm_delayed_work_drop,
> > -                                   &mcu->button_release_emul_work);
> > +             err =3D devm_add_action_or_reset(dev,
> > +                                            omnia_disable_button_relea=
se_work,
> > +                                            &mcu->button_release_emul_=
work);
> >               if (err)
> >                       return err;
> >       }
