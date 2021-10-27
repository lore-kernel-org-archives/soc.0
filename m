Return-Path: <SRS0=ZdmY=PP=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99007C433EF
	for <soc@archiver.kernel.org>; Wed, 27 Oct 2021 08:50:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7011660F9D; Wed, 27 Oct 2021 08:50:03 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADB2C60F0F;
	Wed, 27 Oct 2021 08:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ADB2C60F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M7Jj2-1ma9Nl054G-007pGu; Wed, 27 Oct 2021 10:50:01 +0200
Received: by mail-wr1-f52.google.com with SMTP id e4so2781822wrc.7;
        Wed, 27 Oct 2021 01:50:00 -0700 (PDT)
X-Gm-Message-State: AOAM530KHMEZhWOQZN87qdkXs7Fs57p8DX2BoLfrUF/kdSJTO16hmaEN
	y4CvF4tFWWhApuVfZoQN4GKj1JMyjYyk2dzVtrM=
X-Google-Smtp-Source: ABdhPJzulGMx2l8bar1I6qe5RSM/d5wpOaG0F+fU8zqeLRJg7K2lynybU0xg8HdVMMVSnCWSe2GfQO1flqIYXN352eE=
X-Received: by 2002:a5d:47a3:: with SMTP id 3mr26057935wrb.336.1635324600576;
 Wed, 27 Oct 2021 01:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211027072427.2730827-1-arnd@kernel.org>
In-Reply-To: <20211027072427.2730827-1-arnd@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 27 Oct 2021 10:49:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1CjfRmJsc0p2P2ja1DB6QFsuwnkBdXk1CfdzGjGpK-3A@mail.gmail.com>
Message-ID: <CAK8P3a1CjfRmJsc0p2P2ja1DB6QFsuwnkBdXk1CfdzGjGpK-3A@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom: scm: fix non-SMP build
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <swboyd@chromium.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:JtQ+UGB1wHaP+HUH3ghjoCoaZaAgbcOTVowvyTo8YHkO0d7XBVf
 z+311xmyFybO0XDpbq3m/b17O3FOfbZrenmekojOeWS+cXssV7B28Nmrq5CBe4RHkoI9boZ
 bK/3OWr1AVNLJaKsJ1VKfgbjK9oULpj3Caayk1M8TfFxRXcqVoIVV5Xc+VWxQReHDwCluzN
 5ivJugs0pDoWpYXmZVLBg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8lu4xfRPOHQ=:UoNYf14w0qeslHWJj+vSBn
 QwPUR5Ih6W+QlEytw6EjM9AWkhW9gRUswqbbIWVXaawfp+RU6K4F83M/s7ZjiH45MtGWucnMu
 knChbIlsqew/mczzh1TSFf9hCGKb9JWHeMtWKycCWcZUpjZpzRqRysfqLGx2aDAirzdFw2aYo
 Dg8yTtNeha4dEZvznt3Wqm7R2eUfQOu3KziU0/7E2MrMI61HbKyQPqQvtNCU1RBJfuOUuropu
 kuzGCNvOJ/z93vBzU39WkJexZ5td66dP988/vyTVGeD0LptwQKIm/orsqu7ZTNPoa0bsdzXKc
 s6YoaINvvhZDdgj9Kr3fkcAd7TYMT+5Le9I/iVVZHF9iaSCI3LOr2PyQoPNDlyJF1EGtzPj6F
 Mm8vkzVlTDZkthDG7vGOUMI5ifuUbgeB906l0yRDryak2B7sVQ++AMb2B+PNT/95cqrAnzJSG
 sH4m1qU9ZZMLbVEiKy4G0DxzXeoCjOkfeCJbr6ApE7TEcWfYB33OwKhNcFAsfnVL7FSBCvoaX
 GhnShbFRyeJ9GSeJNOjarRyeDWTgZS7Z+qORVYx53TtOYZwFb2dDILIL58CN1nMexzJMu3ubH
 qcOWlFzLibw87gBrBD2Fm2KvUx+1GSE2yg6umVM4gIEMqgcLQ1PUtWtUKtLywDVg1ZoYF/USd
 DWoanBCUGqG0J763hVBC9PW1jdOx6TP7SOcy2c1GKXfvkh2N9d58Uha1Btd4TCyhVRKVHc0Bv
 5i+fIeDMnZa96yFMmW/iVfeJZIA7rhnL8a2ncdkth3d66c2YbjXFAUcevowgRW3kK462/ENdV
 RTrcajVNYVl/RXJieJk1vUW+3KAp8HdfUmLGxnZkqFRzvf1tZw=

On Wed, Oct 27, 2021 at 9:24 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> A check was added for non-arm platforms, but the same code
> is still broken on Arm non-SMP:
>
> ERROR: modpost: "__cpu_logical_map" [drivers/firmware/qcom-scm.ko] undefined!
>
> Fixes: c50031f03dfe ("firmware: qcom: scm: Don't break compile test on non-ARM platforms")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Nevermind, this is not sufficient, as the symbol is not actually
exported, so this still
fails on SMP configurations, both 32 and 64 bit.

Any ideas for a better fix, or should I revert 55845f46df03
("firmware: qcom: scm:
Add support for MC boot address API") for the merge window?

       Arnd
