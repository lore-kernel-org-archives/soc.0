Return-Path: <SRS0=9lUk=PI=semihalf.com=pan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95205C43219
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 14:52:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7DC1060F57; Wed, 20 Oct 2021 14:52:39 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57E7361359
	for <soc@kernel.org>; Wed, 20 Oct 2021 14:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 57E7361359
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=semihalf.com
Received: by mail-lf1-f53.google.com with SMTP id j21so15792494lfe.0
        for <soc@kernel.org>; Wed, 20 Oct 2021 07:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uF9hWW3HRUf/pq/5JlaNIpHT0L4GbqCbpiYbDrZSHOA=;
        b=0rQGLB9YZvEkHvK2gZzkK/wXAshQ/85L4jcpnYTn/ZXKOUozcal+MHq8WwbHBllJ/n
         bBhmmBhdYW3pchY/eHmwbgkO+eCnMnP/yygJY6Vygqo9ypWELyqpAa/6esI4rE5QR97j
         k5k+RO5/XNlSP9bzowUY4wEmKd6fkztxB2AOq1MOoFLTE/yVe9rZe69DN1meqlbLLyEF
         8KvC2hK/OP/gWiHtVpZ4Kx97+PEKx9bpipD138oGEVd0cEadzRHZ4/yFG1cujSwWN6Ku
         tnJs3hCq2ImnBErlD9yQYGzg3GC/FBNBd6mO/i2yCZ5e6qiKKsNjyaAM6oTNHI4NqjJ2
         QJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uF9hWW3HRUf/pq/5JlaNIpHT0L4GbqCbpiYbDrZSHOA=;
        b=3tePedJadLzu3ZuwVWEndUQ5n+YBhONIUexxCJKV88CsazAoytcMu0rriWLZu2jRGY
         0ObIiMRY1OP5XNWFa28KAnIlxhnuwM7551D1P9sGtF8LYNR/aE9U3VEx0npZJWKxo0X7
         rDbjNjOdZDyPdAkq9AX6ZHp2JfxqTyRxb3Uyl+JPF/clJx0PWrwjJzrqdV+Aq9tLB6ul
         ZYccW4mUGbwQS/cfL4kHTnMyFGTyJMXlFQQvk2gK/aq3phPYkMgmdQ9HrWQM+wR+oYYn
         3IE8RCgAFubBKeS3bC8BDCIVO+hY9eHiQcM/jrDrgdGLgGqvmxSsmfkTaxRBdj5Wo4S9
         5hgQ==
X-Gm-Message-State: AOAM5310EuJmkd/5C6HsxzcYDo+VMVcaWY1VQu+LhOF2rd3rE9ybL3Q3
	ISQbNaKScQbcyaxc7LNkddf4J+9YPGGp87oem5S+dw==
X-Google-Smtp-Source: ABdhPJxpXDFarFNfEzRY7wsOM/9m/aFfKd6h5mqPvuRmjwEt9qei7dVsoAhUSKaOcnD8t59mJNjsNOJJ1O+LDQVLYbY=
X-Received: by 2002:a19:c201:: with SMTP id l1mr252650lfc.92.1634741557199;
 Wed, 20 Oct 2021 07:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211019141228.1271617-1-pan@semihalf.com> <20211019141228.1271617-2-pan@semihalf.com>
 <CAK8P3a0g82DoivaADueeOcKOjNVDiutZLAAWAROzgvuYt83Z3w@mail.gmail.com>
In-Reply-To: <CAK8P3a0g82DoivaADueeOcKOjNVDiutZLAAWAROzgvuYt83Z3w@mail.gmail.com>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
Date: Wed, 20 Oct 2021 17:52:28 +0200
Message-ID: <CAF9_jYQt6ObUcaA0_aKHnQDoKuYPAYT48jfA3_RKE=q1OkCang@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] socfpga: dts: move arria10 aliases to socfpga_arria10.dtsi
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, upstream@semihalf.com, 
	Marcin Wojtas <mw@semihalf.com>, Jacek Majkowski <jam@semihalf.com>, Konrad Adamczyk <ka@semihalf.com>, 
	Tomasz Nowicki <tn@semihalf.com>, Alexandru Stan <amstan@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 20, 2021 at 3:33 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Oct 19, 2021 at 4:12 PM Pawe=C5=82 Anikiel <pan@semihalf.com> wro=
te:
> >
> > socfpga_arria10_socdk.dtsi declares aliases which will most likely
> > be used by other arria10 boards in the exact same way. move these
> > aliases to the parent file.
> >
> > Signed-off-by: Pawe=C5=82 Anikiel <pan@semihalf.com>
>
> No, please move them into the .dts files instead for consistency.
>
> Each board may use a different subset of them, or have them
> numbered differently, so keep it out of the .dtsi file.
>
>      Arnd

Thank you for your remark. The aliases per .dts file were in the v3
patch, however this change was explicitly requested. I will bring that
back and resubmit.

Thanks, Pawe=C5=82.
