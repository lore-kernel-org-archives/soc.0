Return-Path: <SRS0=uhJi=UX=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F77C433F5
	for <soc@archiver.kernel.org>; Wed, 13 Apr 2022 17:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0D805C385A3; Wed, 13 Apr 2022 17:43:16 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 48ED5C385A4;
	Wed, 13 Apr 2022 17:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 48ED5C385A4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MpUpW-1oJZfp29JE-00ptgJ; Wed, 13 Apr 2022 19:43:05 +0200
Received: by mail-wr1-f54.google.com with SMTP id w4so3656519wrg.12;
        Wed, 13 Apr 2022 10:43:05 -0700 (PDT)
X-Gm-Message-State: AOAM532+s0036ZBOkc9kDKbEIzKbv3RKLY9xbV+2k8Hh9h8w8fCtjVwI
	mcyrvnog2BDNHBwBnHRMwB2g80OA6xgZBoN9IPY=
X-Google-Smtp-Source: ABdhPJwTUE1CE1xfami64nFxBY7+IIS64y7rS3jabcIASkKRHKk+Nf5tIYFMb4NymZGjoQlwLVGYUtEMmpOOrUBmG38=
X-Received: by 2002:a5d:6983:0:b0:207:a226:df4b with SMTP id
 g3-20020a5d6983000000b00207a226df4bmr40871wru.192.1649871785202; Wed, 13 Apr
 2022 10:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220310195229.109477-1-nick.hawkins@hpe.com> <20220310195229.109477-9-nick.hawkins@hpe.com>
 <eb66cc83-2da9-8e19-db69-633e34fef946@canonical.com> <PH0PR84MB1718C31DB71AA2A67FEC5F6E88119@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <b1cc2566-cd78-7cb4-f8a5-d6fc8065fe6e@canonical.com> <PH0PR84MB1718292B1C11F4FE83326A5388119@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <fb4def96-4b20-604f-d15d-fef87eb2232d@canonical.com> <PH0PR84MB1718A2CFBFC90C9C0CAA5515881E9@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <CAK8P3a0fCE_NM=z68d1m9BTfuKixh1pKLw3gn+Sr7SxKb6UJAg@mail.gmail.com>
 <PH0PR84MB17181C316E55073EBC28C386881E9@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <PH0PR84MB17185ADBA824F9CC9EB3E022881F9@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <CAK8P3a1080yz9jggOrwz2iQ1sAB2Xe2Emh22uCuqRok60BQSiA@mail.gmail.com>
 <PH0PR84MB17186189F5025374AA39584D88E19@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <CAK8P3a2b+ESAAkc=_2hqx0kOxwYVS6mNjMGBKhhipaSj_5jV9g@mail.gmail.com>
 <PH0PR84MB17182115D57EF6032782659C88E09@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <CAK8P3a1Cc+2oY9djdp11PuOW+TBQ0zf+p8QaDY3aerk1QqaG-g@mail.gmail.com>
 <PH0PR84MB1718925AA3C8FA998C486D7C88E59@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <CAK8P3a3RSST6yvv8Oy13RFd6eZ6cS5yX9TOuK6wxXKUO-qdQ=Q@mail.gmail.com>
 <PH0PR84MB1718C7447207BF210FBB477788E49@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <CAK8P3a3jr-FkyxLff2cK4=X-4AShnKkeYMRKsvUg=2W0bTviiQ@mail.gmail.com> <PH0PR84MB171896DE1EFA3B25A74ADED488EC9@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <PH0PR84MB171896DE1EFA3B25A74ADED488EC9@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 13 Apr 2022 19:42:48 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1_97b14=wbYrFodRLBq_2o2gOOjk2zORp3DLG72O229w@mail.gmail.com>
Message-ID: <CAK8P3a1_97b14=wbYrFodRLBq_2o2gOOjk2zORp3DLG72O229w@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] arch: arm: boot: dts: Introduce HPE GXP Device tree
To: "Hawkins, Nick" <nick.hawkins@hpe.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "Verdun, Jean-Marie" <verdun@hpe.com>, Olof Johansson <olof@lixom.net>, 
	"soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:BErxX8lr+7869NH7Cy6p6NubGGc3P4cvYSuSEcZm5sa+kvBc7Mt
 sQKmlRlWYbZmsAG3gKqcaHJqplT6+Z9IdPNA0r/2Swx4s5f2+lGL7YoFsjhwPUa73W/BvyI
 5vTuY6rXtC1EO6qdt0QIuRgBvGCO7sbtrRZ6sOOzdDbecm3AtMkkG9e7fUn88hyPZVeRwjT
 VQVvvCCxmsExkssEPbKNQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/5oHiDP4OGs=:zIig2ozL6dx9IWwjzvVhlI
 aAPro+4/Q6subbjRDFmKuMA66BVV18NHsX6eA9UQJSB+PwLD2hlrv99plbYAUmOzN0m9i+ZFy
 zHvSgeZDZAQ8O1QfT7eGgLk0k2kISdx+nhh9IKswPEs3UyETni8Fqzv2LPd3Sxct3IzF/8WsS
 E6TzaB2aFZQt0YEq1PfbcAflJ0TiOxbZdy/D0xGND/jbSe951olQukFM1HF5MdfzOJNsAu6Ko
 8OGt6PAetoJvHsCqrgrHPwVljxB+6b92DELQH2sFwGIbSNi5SATQZAnelmE037M+PRV/CVhbI
 Y3xc+FirNqKman5aIxZtGhaBATN03xaXFUppfiY7Wj4K2jSafab75vVbCAK4PO5JIy/YlcXhT
 BHYGPHGvTOs3sR21PTS0f1X/DLRPZmEqUIFZuPIZfO9dWPmbSw4955Z/zlOMQgU8DCfgudHVu
 ePfVysjjbyDRSGCRj5s9r2+05mgDyX22q21hHtSZNJgIjisbO9Rboo8nR/5cG4aylbj/rl8sd
 D7t+9I7zjVpoMrFmJqkM84nQIr8yC+/ROJ9elja5cGrSxo7jZFW3ul4j+79321SUHt5y52nhu
 89isYnRzo1j79MONCDH6e3UjLA9NWoGnLEQiVJZ+tv3taBdGaIjYux/egMujqCX8mMGXHcXrw
 EAeJ4iAxevkSjgGtktUghonIHrxeD5cvQCrLath3/ThJ6Np6We5sCfmPhsOYa/Up2zHI=

On Wed, Apr 13, 2022 at 6:48 PM Hawkins, Nick <nick.hawkins@hpe.com> wrote:
> > I would count passing a register address to the child device as a private interface.
> > It's a minimalistic one, but that is not a bad thing here.
>
> Thank you. Now that the parent/child issue with timer/watchdog is resolved I am now
> having an issue trying to access "iopclk" from "gxp-timer". I have tried use of
>  of_clk_get_by_name and of_clk_get which both fail to find the clock.
> Is it because clocks is outside of the axi -> ahb hierarchy?

No, that should work, but you have to pass the right device node, which would
correspond to the parent device. You should also be able to pass the parent
device pointer (i.e. linux device, not device_node) and use clk_get().

        Arnd
