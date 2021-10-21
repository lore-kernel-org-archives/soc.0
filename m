Return-Path: <SRS0=6Q0g=PJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 958C4C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 15:36:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5228561130
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 15:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5228561130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nEdpeCpOidGf/24EFGWfxzWfF97QAnGOyp39HCG0Ydo=; b=LHlvGfk7Lnpqgj
	4Zkn6PbN+N2znbsD784SeK2ck1UfY7azuYZRnfwKGabjzoro09Upt6ImDMtmppofakF1+IzKmOEgr
	+/fXvPOcxCxLa9UoYHB1BzfXsHs9pdx+oW9LRxwNiAtG9hkAtChr6N7MG4u4xe/4skJQV1Opg3Viu
	vui7kTZ2qQHKn/Dia9mE4BsELsjM4uBNTGJMnXiuHswBOLQYdH0YzniEZONWVCibVYh5tMH5NEye4
	D8ka6Z5dal7zW4ffN8W8NyFg5glOgZ/MOOUjy5DEyP7TXMqoycpueABgjzxXl+BNuM4088ilM/5oZ
	cGUNMlc2FycF6Gax5d2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mda5U-0089VV-AK; Thu, 21 Oct 2021 15:34:36 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mda5N-0089Sw-Ij
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Oct 2021 15:34:31 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MRCFw-1mIlz514ke-00N9DA for <linux-arm-kernel@lists.infradead.org>; Thu, 21
 Oct 2021 17:34:27 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 193-20020a1c01ca000000b00327775075f7so85542wmb.5
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 21 Oct 2021 08:34:27 -0700 (PDT)
X-Gm-Message-State: AOAM532C/Bvw883TcC7nsrGEPL0jjmZ8F5R35h9VgH/5zsyweGp541at
 uKrNF6n720uaFm58Cayi/3cgzLX7a+99pOBsJpw=
X-Google-Smtp-Source: ABdhPJxXncWjnG0sJW6NQ2Y9XBmC9AcHboOLxbofUUlK3ALWGyEu4Nd9mK94PrbsNQQGlWRLZDhWj2rD2O1jkn6ZwhY=
X-Received: by 2002:a05:600c:4f42:: with SMTP id
 m2mr21988450wmq.82.1634830466894; 
 Thu, 21 Oct 2021 08:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211021151736.2096926-1-pan@semihalf.com>
 <20211021151736.2096926-2-pan@semihalf.com>
In-Reply-To: <20211021151736.2096926-2-pan@semihalf.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Oct 2021 17:34:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1i_23yBht0f86GoHUeef+XXPg_ahkMy6ndARHqcrhKWA@mail.gmail.com>
Message-ID: <CAK8P3a1i_23yBht0f86GoHUeef+XXPg_ahkMy6ndARHqcrhKWA@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] dts: socfpga: Add Mercury+ AA1 devicetree
To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 SoC Team <soc@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, upstream@semihalf.com,
 Marcin Wojtas <mw@semihalf.com>, Konrad Adamczyk <ka@semihalf.com>,
 Jacek Majkowski <jam@semihalf.com>, 
 Tomasz Nowicki <tn@semihalf.com>, Alexandru Stan <amstan@google.com>, 
 Joanna Brozek <jbrozek@antmicro.com>, Mariusz Glebocki <mglebocki@antmicro.com>,
 Tomasz Gorochowik <tgorochowik@antmicro.com>,
 Maciej Mikunda <mmikunda@antmicro.com>
X-Provags-ID: V03:K1:3e8zt7JlohKdFZfpDJheXKkvT/XVxz7jyq9XLhWJQyNdNc8uahW
 EwQ3kOy44JnIO5fkYKJz+bD/CwjAZyUPrrhcGyiXrzEJSTILx9ySJ7QclSDEqPdNCCNFzL8
 KYEEk+Tk7STFV9Y05JfPzA6NDt9wxlTbnuLSzLcdUBQJCRd0/9H+JgG1kB+BobC2WdQz4u/
 qJZoKnCwWhl3J1qs6GxBg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y2LVz5vS5W0=:BhLJ1wbohq1gf9KJ2AmccK
 lxCnDEEwix46y0pbu5NNWCqD8uP6MfmTxzhb9R/RthYfOLwEdSgmvwL85lFUs/gqzO9J+HZaR
 XWsn9/uIT8zedCrHElQNiN35nFuxYRTNTi2heK4p5jHmTOjenowm6ugCX/F3gkUnRBqmEYULa
 WLfnvsoOvstOOs7anIoU85bh8iGgL4Nkvusq70vlIGExFfoV6oi2jCaPleqrySVwMxtOsSVMS
 dgpSLx+z1sr/F5W51KrR6oG175dWOWgk1bGI2hZ3BaqLM5KTMgaT/NlhfGRNJSXGl/W7jXkEe
 Y2zH3UEo9Xyw7eCjAZII9LunLSHadX0cFulnR0Xt25H9EIm2qDciCAnqinc6XDABAkoTG/rvN
 KzhNn5S7n72ThK9NERb8SB9VE5Xv34DIltJTyFSQh1mxItICxM//ZtVII08EhugQZHQKXv+hc
 Vr+OK/jRT2VEfrJIO5EfX2iM5DndZkIfEG9b7uzch8EsjTX9NFcT7yGfiWWvPlbbNSqK+ZspF
 lxLnofa8b9+OmfCZ+uoPgsF9jUlHJ0ULV1j4WWgQh/aZkjs7B6zSQ9HV/UvqNaJs1Wqt3fj08
 gQ0jZkqQut+DLlHRXiV1GuIN9D1gh6u1kgXeO0DQUAxXZqem6avzzBsKBFQ9SwGufjjmB8hou
 fFa5zt9oZ0lPzauB4ZuWch8pfO3NpNjSHBagUFPARfo+5MGicGM0um2BSsdN0CCzxgPjg3ENB
 tMm+nCgDaMO/6hNoxHpdrzYsaiVmDW8EuQ4BzCs60+9gH9Ofr5hEnuGqJ9BZRJ/M6wfRAE3Fj
 YNE12ACzLrdjcUYOTrC4jr7mMjuRcNxbN6fUcBgrQ2ONySiSB4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_083429_955227_EAD9030C 
X-CRM114-Status: GOOD (  11.90  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211021153410.hkRFSun97bZ7RTA2Jvt6NdxY0xVa8SIdikOZNgWtx9c@z>

T24gVGh1LCBPY3QgMjEsIDIwMjEgYXQgNToxNyBQTSBQYXdlxYIgQW5pa2llbCA8cGFuQHNlbWlo
YWxmLmNvbT4gd3JvdGU6Cj4KPiBBZGQgc3VwcG9ydCBmb3IgdGhlIE1lcmN1cnkrIEFBMSBtb2R1
bGUgZm9yIEFycmlhIDEwIFNvQyBGUEdBLgo+Cj4gU2lnbmVkLW9mZi1ieTogUGF3ZcWCIEFuaWtp
ZWwgPHBhbkBzZW1paGFsZi5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSm9hbm5hIEJyb3playA8amJy
b3pla0BhbnRtaWNyby5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTWFyaXVzeiBHbGVib2NraSA8bWds
ZWJvY2tpQGFudG1pY3JvLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBUb21hc3ogR29yb2Nob3dpayA8
dGdvcm9jaG93aWtAYW50bWljcm8uY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1hY2llaiBNaWt1bmRh
IDxtbWlrdW5kYUBhbnRtaWNyby5jb20+CgpUaGFuayB5b3UgZm9yIHRoZSByZXNwaW4sIGxvb2tz
IGdvb2QgdG8gbWUgbm93LgoKUmV2aWV3ZWQtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+CgpEaW5oLCBhcmUgeW91IHBsYW5uaW5nIHRvIHBpY2sgdGhpcyB1cCBpbnRvIHlvdXIgc29j
ZnBnYSB0cmVlLCBvcgpzaG91bGQgSSBhcHBseSBpdCBkaXJlY3RseSB0byB0aGUgc29jIHRyZWUg
dGhpcyB0aW1lPwoKICAgICAgICBBcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
