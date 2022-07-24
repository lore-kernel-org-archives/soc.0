Return-Path: <SRS0=mK9O=X5=gmail.com=matti.lehtimaki@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C64CC433EF
	for <soc@archiver.kernel.org>; Sun, 24 Jul 2022 20:43:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 46BB2C341C0; Sun, 24 Jul 2022 20:43:05 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8B327C3411E;
	Sun, 24 Jul 2022 20:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8B327C3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id a23so12968795lfm.10;
        Sun, 24 Jul 2022 13:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=pA5BfuMOUHYHwO3N3zLiAEa59H7++ZYtYbgRtUC4lS4=;
        b=lJXN7Mz3DhZbhXRMSD1q7ouCf+C/Tq2lVQRBhzyr81PRVogA1pF7cWdnJk2GGE6BEi
         cNWiQECTbjrN8BXsDsfKAIwp3/FqrEmEw4lAMXKd5uMn1ONVR4h7jdD/Lp5J7wO1CZvu
         IKEu1Ui9mjZiVngVLJfsnRUtgh6zg/HCDXZqWE5iqtOfEL8hlVgOg+xoEwOru6aMsUVv
         8ny32y+fgPncX00nKUoKhAlDs3uGaQ0rRNhrLOL7qd85rYwLhQEtynAeUbqHOGb9aCS0
         BS0yooKkzjmULCG2M7VjKIAX1+5qKJLvlpvdaPzMgiQ/GhjOhTNDl76RVLJuE07pNQoc
         wZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pA5BfuMOUHYHwO3N3zLiAEa59H7++ZYtYbgRtUC4lS4=;
        b=UOV+9HR6S5AJxkGoy+NqdX9WHu22JWYVPROQJw30QGE+AsDjQWpSTmRyRUPi6NJpVj
         HiSPCFOlyN13qcP0cYmpI2lE/BQ0UZNfOFaaXUgfd3eLfzgVQj8ao7a+0BsdpCV+2qJf
         Nj08DiM56Yk87kAcarMR/jqIZKlrcCe/QXX+VyhZho84BGzDn0anj5VeCLYWtAKjdGAr
         64JmqiG2cTCr7hk4O+imxFrKfXnSoCTiWrcpyRjDzIOc65n5y7QK712FWrzTl4eZuJ3D
         yngV7mHSK3qRzri32nV4rFKbVA5U2UMjIKUoBFeNVVr9775ZKtDG4RGo8XrZYz61z+vR
         bk4A==
X-Gm-Message-State: AJIora8vtkSbvhjrUEBDrgRWWjZqoFxp5h/cqmsvEKbPT6iKeSjJkf+o
	YBFc0sopsdw/OjeEwFhmxJU=
X-Google-Smtp-Source: AGRyM1vz4PlnN9YFCrpKpPzMIUBnbgCXz3iqng6JaKTnN1dOdYoY0ESf4MOXCwwUG0M3IxQAjIOkvQ==
X-Received: by 2002:a05:6512:2284:b0:48a:7c35:2729 with SMTP id f4-20020a056512228400b0048a7c352729mr3654822lfu.397.1658695382591;
        Sun, 24 Jul 2022 13:43:02 -0700 (PDT)
Received: from [192.168.0.108] (dsl-hkibng42-5673c7-93.dhcp.inet.fi. [86.115.199.93])
        by smtp.googlemail.com with ESMTPSA id r12-20020ac252ac000000b0048a833a14edsm908766lfm.201.2022.07.24.13.43.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Jul 2022 13:43:02 -0700 (PDT)
Message-ID: <5d500d42-3926-20f1-a677-3b77c4b2e8ca@gmail.com>
Date: Sun, 24 Jul 2022 23:43:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 3/3] ARM: dts: qcom: Add support for Samsung Galaxy Tab
 4 10.1 (SM-T530)
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220724172442.87830-1-matti.lehtimaki@gmail.com>
 <20220724172442.87830-4-matti.lehtimaki@gmail.com>
 <CAA8EJpqUH_v1GXEYF62Z3DBtFu_305_h4D36aCnBr38bo5HoJw@mail.gmail.com>
From: =?UTF-8?Q?Matti_Lehtim=c3=a4ki?= <matti.lehtimaki@gmail.com>
In-Reply-To: <CAA8EJpqUH_v1GXEYF62Z3DBtFu_305_h4D36aCnBr38bo5HoJw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.7.2022 21.55, Dmitry Baryshkov wrote:
> On Sun, 24 Jul 2022 at 20:25, Matti Lehtimäki <matti.lehtimaki@gmail.com> wrote:
>> +/delete-node/ &smem_region;
> 
> Please move this to the /reserved-memory node. having it there would
> help understanding that we are just changing the address.

I can move this to /reserved-memory node in next version. Other option
would be to have a comment here, it seems both ways are used.

>> +       i2c-muic {
>> +               compatible = "i2c-gpio";
> 
> Is there any reason for using i2c-gpio rather than blsp_i2c4?
> According to the pinctrl-msm8226, gpio14/15 can be mapped to the blsp.

The reason to use i2c-gpio for this was using the other devices with
similar node as an example. I tested and having the muic node in
blsp_i2c4 worked the same.

-Matti
