Return-Path: <SRS0=wsnO=LT=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8679CC2B9F4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jun 2021 18:44:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E38F61949
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jun 2021 18:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E38F61949
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/hwPAZmaQw+oRQS/P2bEi0EElBNdy1Nn6TF9lBy0DuQ=; b=sT48aUIV+DFPOk
	IS50m5oasJ3kr34IUZhGrntcVJX5oaVDQVIsS5xclyrGYIzKkEZfatF8lJOdrKFhBm6GqP9HP60QG
	NasJ4hKXBnl7/yPn+vqUbh+58LOC6F3JnolZsum3+JRUT5Mxsu46uxVt4FSiYPDzfmDFfqPsgTtxV
	kaAXnRhXy/vUKHc+tXWe3OwlBsu3+HrvnlnCxqV0hk9jWutzHLu4wgRjZQDFAMIczu/n6bWtc22qO
	onApC1rq7Qx8VUy600mEci3YuWI+qmJZl0bCS2g0CjS08zhH2EQ9WxgFiuxby67HxSvxnzMlUU80d
	te0ze0XQ0aZLZYuGSaKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwqnX-002bFk-Fk; Fri, 25 Jun 2021 18:43:27 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwqnT-002bEr-EG
 for linux-arm-kernel@lists.infradead.org; Fri, 25 Jun 2021 18:43:25 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N6sON-1lBTcO1DJv-018HYs for <linux-arm-kernel@lists.infradead.org>; Fri, 25
 Jun 2021 20:43:19 +0200
Received: by mail-wr1-f51.google.com with SMTP id i94so11648413wri.4
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 25 Jun 2021 11:43:19 -0700 (PDT)
X-Gm-Message-State: AOAM531J3ntLA2ggUlfT9YW/vTLXsjjc5wBBGdAeTrvzy7DWHkJw5/WC
 aMDiV50tA21Q46IkQ79Kxr/mHugWKz07YY3jvNI=
X-Google-Smtp-Source: ABdhPJwEXB6pH4EHQ72kI8pnEN58pZxj/e6S9sYcBbs1qDXwS2ssmZPovadGPW6KqNN5AXcIRA/EzxF4GTRTCN5h100=
X-Received: by 2002:a5d:5905:: with SMTP id v5mr13106064wrd.361.1624646598834; 
 Fri, 25 Jun 2021 11:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210625095000.3358973-1-mnhagan88@gmail.com>
 <20210625095000.3358973-3-mnhagan88@gmail.com>
 <CAK8P3a3NAOgBa1j+Zsm6FwSm2ux49rFcnTEYJJsmSF8TggRnYA@mail.gmail.com>
 <bbf38c31-ed75-69d2-39ed-94f324b1f220@gmail.com>
 <21e895e9-0211-0c97-5e9e-781e6d2fe6dd@gmail.com>
In-Reply-To: <21e895e9-0211-0c97-5e9e-781e6d2fe6dd@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 25 Jun 2021 20:40:53 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3vHOyFVnBTBpJ9_N8QPtb_dhU+itBXixrL3gjEuGpKkA@mail.gmail.com>
Message-ID: <CAK8P3a3vHOyFVnBTBpJ9_N8QPtb_dhU+itBXixrL3gjEuGpKkA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] ARM: dts: NSP: Add DT files for Meraki MX64 series
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Matthew Hagan <mnhagan88@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>,
 SoC Team <soc@kernel.org>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, DTML <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-Provags-ID: V03:K1:/jXGN+N2lRZLlwLZjLF50h+vOQJdVhTSSxDi3B0Q42MlF+QjKwc
 nDLrVnMzFICESfTOWfVBaxThq1eFAoNgAx5gs/7qXNS+hAhPCH6T+HYs3R4Rh8oPt8igFWx
 6UmaP/XXNsV6OHrcunEGGbu1p31mOKbNZH2Wh4tlhGVAP1D0gPdKeBcdjOq9e3+4Sddfj9e
 5SbVf46KWL/ZNz1aZV4GQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6/b2Ia1PJhg=:FOp/3IARlNwfRX2Zrpy/wi
 Cw6dqpfs+734zyicinrjiPsCKWD4mdjfW49FHyJs+vVzXHMFtH8eIFFXqDZP/jQzLzr3Y/goj
 xSHQpWeHvtMhFtEcD/ME7E0Q6FjY6C5yelrI7+9OVX3Pn0hPZUG/s7AUlbPrbNJhzScXXlLSe
 xn4W0ti4nReDEc5GMGJJ1gjII3Cjngf5eKkvsFUdzwXbm16lxZSoB9WPhpSQrlUSKPsmObibK
 qNz+Rz2F1PVEomKw/Hi0iyyqLOy+ESZmvmNpp1j2oyZcZThjGZOFEGERjLShRB62MLEgapdYI
 W0YKRP5YHn9FU9q68aimqJRHgza+RkszdLkI7IS0V/RrpyVKcvrI8umeYrSbVUa9KT+aQMc04
 I2xeZeXZ+ih3044vergHjnVTxQEY+knvOCNXDLkxOb3o0ENfIguIb3tMTxT5W+UkqNvejc61F
 AjykHzSHL6FOQwdN+r6SEA14lH0WkKXYdRtgi1fW/ccKoy5sZlonnGiGwDIq8kK6enIAT+zrt
 3k6x1o9Pi3aMBJ/hHUDC5pAS5hAqFuQ+iacnvcBHpx0CLnmq8y2QmR+t8Qrzcffmj44lAq/z4
 No2a1nEE/ehY1YqRDZotsM+PEN6h1cRy/Wjk/mz68kB/YGfnGaSo4M+y3SLnZh/bYXQratmRb
 UgLWXBrnR7nPkRNsIYnXfTOlygo+btSiQU30sTBwTQ7tDmDeDYJmD4TIIe5bQ0jaj8N9JKy3N
 nVenPcjTtHi7/5Me6O8urBkeJ7fumJ/oob/9Fbx6xxQcFiG+etzwE44vGPe2Agcx8FchGO7bp
 DDwRoUQOjUJEpIysk4HF/T9e9gzIBfrB94x+JTX1dRVTQRbmd6vhgmWfWBw7VBVxKtLYbTRqD
 DsNYRzWgtbTm5iQIetcHmWC36wpDN/EnjiOjbdp2Ge4tbHlqkj+nyPjhwuQot81h6sxcWdxFK
 AMqDFqJOLMQ/0+ck+dncFmtvlu8ZUE8JluK3td50ihAYiaf39GFRY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_114323_824054_BC12B207 
X-CRM114-Status: GOOD (  28.93  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210625184053.wcagdd6m8mqVmq1GmR-I5oGdkqT1t2UzhqUCQMe3ULY@z>

On Fri, Jun 25, 2021 at 7:30 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> On 6/25/21 10:26 AM, Matthew Hagan wrote:
> > On 25/06/2021 10:59, Arnd Bergmann wrote:
> >
> > How about having separate bcm-nsp-ax and bcm-nsp-bx dtsi files with the
> > appropriate secondary-boot-reg and dma-coherent (or lack of)
> > properties, which then include bcm-nsp.dtsi. Thus we can also avoid use
> > of /delete-property/. Would this be preferable?

That sounds good to me.

> Is there any way that the Ax platforms could use a small shim between
> the boot loader and the kernel which could all of the necessary DT
> adaptation so the kernel only contains a single Device Tree source?
>
> Using something like this:
>
> https://github.com/zonque/pxa-impedance-matcher/
>
> could be useful.

I don't think that's necessary here, but I wouldn't object if someone
finds it useful and does the work. ;-)

> >> On the other hand, the /chosen, /aliases and  /memory nodes that you have
> >> in the .dtsi file should probably get moved into the .dts files, as these tend
> >> to be board specific settings, even if the examples you have are all
> >> the same.
> >
> > I did not come across any convention regarding this, though there are
> > plenty of cases where the /chosen, /aliases and /memory nodes are
> > defined in a .dtsi file and used by multiple similar boards. Also note
> > in this case /aliases is defined in bcm-nsp.dtsi, not by me. Would we
> > not prefer to avoid having 6x duplication?

We are not too consistent about this, and there are cases in which a
.dtsi file is used for a family of boards using different SoCs rather than
a particular SoC or SoC family.

In the bcm-nsp.dtsi example you mention, I would move the aliases into
the board files, mainly because there is no guarantee that each board
exposes both uarts and all three on-chip ethernet ports. Note that the
aliases are supposed to match whatever label you have on the board,
not what the numbers are in the chip.

      Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
