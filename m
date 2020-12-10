Return-Path: <SRS0=rNyZ=FO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDC1C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 10:34:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4E1023BE5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 10:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4E1023BE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RrnozyFaB1a6T2rCxywkXsZcTuacEeveseZ7jNHieKk=; b=z3mT+cH6QbCDtHYV2Ax5+O45t
	Q6fFtczO5uP4EBTT4xzguFoyWcHB6xd7cLrtqrH8GIcfxf3VRWIs6qXkKPWykO06Msnuw45CREuWR
	a19rZTNIrFScXnL9ozww+r5dmudHa72Jmu0RxQGzmRTYd9c7U6M7WAm5feuPGeVZYNsYAypTO0zCR
	ZjOF29SXXJH46taBEHz80Yg+mVEDjDHM1gHYqzSSdVvuKdLdsSl9gd/BavTl8BvPdX0/awEDPEumZ
	iBpK/UJoxYV7ys4UPNPyVezLNB5olEiOytOWk79qRgdrXUrGGy7Y5DPm7MGy+HXMTNvYX1TX6mvNt
	48GGuB76w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knJGA-00080x-PJ; Thu, 10 Dec 2020 10:33:18 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knJG5-0007z1-0n
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Dec 2020 10:33:14 +0000
Received: by mail-qv1-xf43.google.com with SMTP id j13so2108468qvi.8
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 10 Dec 2020 02:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6nfEy7jb4JxUEN3UyBm4VG+qNR9wioZAF6quKu0rvhQ=;
 b=UivoiDMfsRAwmZ/ZLGjUImJpkcyCQo02ymzAKS7rp6+ceFp9V1DnsjBzxirP4Rzt/4
 9Im9/toCJyxJbeG8opl2ngddMKgyKT2+mtJrcAhNkmvalLFxOcT/uivTCNjhnid7buqU
 QsRW138BI3fo1Ts6x9aGLtV7zE/rhkvEj3emo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6nfEy7jb4JxUEN3UyBm4VG+qNR9wioZAF6quKu0rvhQ=;
 b=jwR3/CUpOcS+k6cV4f4kzxFBWZ0VVJ8MdZn0+nS0elO2hSI0XLnJpBMhQWh3Zj8YXZ
 3NH/9NpMQQq3HWbkKLAu32RWyrXb5e9rTg3phFs2b0OZZfUS1I4m0aqBLXMae36cui0I
 dvn6CUeqjhh1ZPwHMPJblhPlrS03G0qowB1Vxc6Jz0vDQhhWL7b0k/zWS5aKWkoby42w
 eO6XAyUGyRbm+4LwznPcGr5DCyc0GieBANCW+MF8YXADTf3UiocsM+QEty1hh/za6Pnh
 uAnWkAhJeEPOMgaHmktyFR/25bdWe1VgmLTw/63Uzi2vmdcDUlJ809QlbJiBg5f89VYa
 KoWw==
X-Gm-Message-State: AOAM533JS2rLCVkx3NjXQghOWsERV0e+6dsJ6qAr2zk9P/xqxj1lceHK
 5IALdIOo6Wv3ephI0ZO/+LC4HDOXFvGP0JkeVIMH5w==
X-Google-Smtp-Source: ABdhPJzZGRjhEeNNEDGAWAw+JmsON7yXLlAyf0iR1s+9MtHGwvfratcRgIz5ZM01Ii2KY29VX/Ss2pqrNPcIr18iTC0=
X-Received: by 2002:a05:6214:140d:: with SMTP id
 n13mr4614903qvx.45.1607596391428; 
 Thu, 10 Dec 2020 02:33:11 -0800 (PST)
MIME-Version: 1.0
References: <20201201134330.3037007-1-daniel@0x0f.com>
 <20201201134330.3037007-2-daniel@0x0f.com>
 <20201209163536.GB566058@robh.at.kernel.org>
In-Reply-To: <20201209163536.GB566058@robh.at.kernel.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 10 Dec 2020 19:33:00 +0900
Message-ID: <CAFr9PXmuCJJ0LXTcH56Dv_ddePaqLtVFVgeJdv7hVN7yRRyj-Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: mstar: Add binding details for
 mstar, smpctrl
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_053313_096857_F4C86FE6 
X-CRM114-Status: GOOD (  14.44  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, olof@lixom.net, Willy Tarreau <w@1wt.eu>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201210103300.v22tzMxOFD5joRdsOBnaf7SK0rx56PwzN9ImVnXolQE@z>

Hi Rob,

On Thu, 10 Dec 2020 at 01:35, Rob Herring <robh@kernel.org> wrote:
> On Tue, Dec 01, 2020 at 10:43:21PM +0900, Daniel Palmer wrote:
> > This adds a YAML description of the smpctrl node needed by the
> > platform code for the MStar/SigmaStar Armv7 SoCs to boot secondary cpus.
>
> You need an 'enable-method' string defined too.

The machine has smp ops set so I didn't think this was needed?
I was going to convert it to using enable-method in the cpu node but
the same code is used to enable the secondary cpu in all of the chips
with a second cpu so I didn't think I was really needed.

Thanks,

Daniel

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
