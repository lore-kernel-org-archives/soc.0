Return-Path: <SRS0=FdBY=VA=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87171C433F5
	for <soc@archiver.kernel.org>; Fri, 22 Apr 2022 13:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 49CC6C385A4; Fri, 22 Apr 2022 13:06:59 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8564DC385A0;
	Fri, 22 Apr 2022 13:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8564DC385A0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MSqbe-1nKGlF1bzS-00UHlc; Fri, 22 Apr 2022 15:06:55 +0200
Received: by mail-wr1-f41.google.com with SMTP id u3so11005676wrg.3;
        Fri, 22 Apr 2022 06:06:55 -0700 (PDT)
X-Gm-Message-State: AOAM531I6/dYuWh0dYy7HSNaZEBKZ/bjMO84XlUiVZWPt5R6fAezwIfv
	swTEUCnpCMjACKDCIyBj9nplVJDlhD7d6saOV2k=
X-Google-Smtp-Source: ABdhPJzr/sEIyUtXuTAvF8Q8/DssMA5FZLT4Nk4euAN9C8OsZ19szl+6WaUMm+cqYUy3lMIOfLqToKLe+raWpc5CMcM=
X-Received: by 2002:a5d:49cb:0:b0:20a:cee3:54fc with SMTP id
 t11-20020a5d49cb000000b0020acee354fcmr122170wrs.12.1650632815075; Fri, 22 Apr
 2022 06:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220421192132.109954-1-nick.hawkins@hpe.com> <20220421192132.109954-11-nick.hawkins@hpe.com>
In-Reply-To: <20220421192132.109954-11-nick.hawkins@hpe.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 22 Apr 2022 15:06:38 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2axNe=w_5PDdSQ8tDZFand_aEQxdgrNMx0uUKYKVmWtw@mail.gmail.com>
Message-ID: <CAK8P3a2axNe=w_5PDdSQ8tDZFand_aEQxdgrNMx0uUKYKVmWtw@mail.gmail.com>
Subject: Re: [PATCH v5 10/11] arch: arm: boot: dts: Introduce HPE GXP Device tree
To: "Hawkins, Nick" <nick.hawkins@hpe.com>
List-Id: <soc.lore.kernel.org>
Cc: "Verdun, Jean-Marie" <verdun@hpe.com>, Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>, 
	OpenBMC Maillist <openbmc@lists.ozlabs.org>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:An/emhIC5bx6DcUFVv+kpN7kxkD+eNi2enJeuObjV1V/9t8psEk
 Od1PTtqCqHJEKv9UUEVF9FtHSpNXnbe2eTUv5luIfL2fGQTZVXoDNgHUYTvWPPIhCmzVXd7
 lA+oyblk2lVrdpVA4fnUcXHNghsker+RkX+Hyfcc+DSq69PXjx/uKJPYIfiUiBDxmVOJwxU
 /hE53NY3akSAmxwvV0lxg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BUM27cOpnxw=:RKS8pJmlwYtvm3MjsG0Fph
 PJ2Ux+kGjSJC/DAOj9PSzbl6kOVIlSySH8p2eneZ2Xmh2WeHGZAgcZ5PzL3B2xWjCMXWX8sc1
 hAObsAC+3Sk5EWXEZRve8Tk3m+TJrGkJ37CWIM8OkFI0oY/bN6Xce6f813V6t5ndtIzb52xX8
 p7+v1o4X9LLlehpKJyp5bkESiN/30kDT2ASHeoD+11pI0L/ZePCSWIltG1oLVNaomuzrFFuii
 qmt7GkfeZFrlV8SdDjq8T3Ou9HDk64ZMj66ZgNeSdvxDJtnzrWRh/p+IghqRhPB66opf8sD9A
 6OsCzwqQEg3vRkn0892hGTJxwAWhPq9jjUXK3msoB+JlBgNLm6LS0PDErWx9SdyVxOQmffuOU
 okx0gBIrDVNM968hM0S+2mKxCR5BCv6C0BhU1CL0tRoeTLPCpKnFazUbh8XVdFSsUd1tzJswZ
 3ZT9NKVjj28dP5FNbnrshhZjEtJYLV4j59tD5hBD8EmgHLx5QhstSIXL+s/RbP2ITBzy5h5x9
 enBsc2uNoJDFPP4x9CL5Fdb4CCaN+tfF3SFqWlyI4Q3zKQYAqAyrAni4XbEjCPxJR0g2qQiyS
 FKdFEsyn+sMY+uJmxBQyilFvRsMJ786P6CyBuBjpSDjfMPLOLGxDYvzLHQ27LbYFJ+GCAVxDP
 19ftCaVEQUduCkuyXc0nlXz6ZbyUQTMQDwH4IHvceQLtyiHd1kepbBkMPybBsjIO6TB4=

On Thu, Apr 21, 2022 at 9:21 PM <nick.hawkins@hpe.com> wrote:

> +       axi {
> +               compatible = "simple-bus";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +               dma-ranges;
> +
> +               ahb@c0000000 {
> +                       compatible = "simple-bus";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges = <0x0 0xc0000000 0x30000000>;

I think you should add a "dma-ranges" property in the ahb node as well,
otherwise this would mean that none of the children are DMA capable,
when at the minimum the USB controllers require DMA.

       Arnd
