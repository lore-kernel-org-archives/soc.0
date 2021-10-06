Return-Path: <SRS0=GOBS=O2=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E66FC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Oct 2021 09:43:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0088561042
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Oct 2021 09:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0088561042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qdEPtA/qnJ77Pe2JeyDmLMnGlP6z5EHaAhh4W40FCyg=; b=SawW9949jjnt3c
	TX+mUlGUeq+wfNZjLuxk+92srzTBAJurTm4uMYyWd3cFD48y1mV338BHdFWt7kG90LdipoDkdj5t2
	RDYtn5UZ6zSfCBF+6nMIWtwYExOIN/gEICblvxKmSaQJuI/H5gpd6m9ymdp8dIOk2etY1NrmVkONh
	37Id+syliU5RN2RlUdWgUtMsod8c/euEUk2A4EZaf/sgsHxE0Ves3/g4T933ulnnAPTpqzPufW0Rn
	rJn8+zBLvFC8T7XBPiJuO6GLr0VNWQTWjptyxN0+X+MMpdastXknldhVAcStoli0Ht5TsDlNxSF7a
	sAKFamP1am0N2YJA9wnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mY3Qi-00DeSH-Nk; Wed, 06 Oct 2021 09:41:40 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mY3Qf-00DeRH-4H
 for linux-arm-kernel@lists.infradead.org; Wed, 06 Oct 2021 09:41:38 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MIdW9-1mb3Zz42sv-00EZyq for <linux-arm-kernel@lists.infradead.org>; Wed, 06
 Oct 2021 11:41:34 +0200
Received: by mail-wr1-f52.google.com with SMTP id r10so6879425wra.12
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 06 Oct 2021 02:41:34 -0700 (PDT)
X-Gm-Message-State: AOAM533Nq1If439tKnPH6xjTUaUaCjn6pHmHqXzb3yI1EtCSdcehM2PA
 nwERd3RCV2eAmqxbBLLQUfs2CRHDTFB/u6c4Vgk=
X-Google-Smtp-Source: ABdhPJzuUsHOXGfVTMW+P7qssYpQP5oaRsPeV3BXJdI5XYLdC7KWD9rwYpR6EFP3ZXNbb0wReeC/Muz0a9i/u3qzDE0=
X-Received: by 2002:adf:ab46:: with SMTP id r6mr4566458wrc.71.1633513294130;
 Wed, 06 Oct 2021 02:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211005143748.2471647-1-pan@semihalf.com>
 <20211005143748.2471647-3-pan@semihalf.com>
 <CAK8P3a1kj1G3TkM7bK3ckXoG8_PTLURAcpDRmDxdnjutEPMsug@mail.gmail.com>
 <YVx9IMk7cJSCK79/@piout.net>
 <CAF9_jYT6mbk6dr8=ZYZ8B=gxnuHas7QBfDfuoTJnMzSKZt=WGw@mail.gmail.com>
In-Reply-To: <CAF9_jYT6mbk6dr8=ZYZ8B=gxnuHas7QBfDfuoTJnMzSKZt=WGw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 6 Oct 2021 11:41:17 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0f=fahxax1jOz32uLzitV_PRPoHAfrQLx_qccmh_gcXg@mail.gmail.com>
Message-ID: <CAK8P3a0f=fahxax1jOz32uLzitV_PRPoHAfrQLx_qccmh_gcXg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: add bus number property
To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>, jarkko.nikula@linux.intel.com, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Olof Johansson <olof@lixom.net>,
 SoC Team <soc@kernel.org>, 
 Dinh Nguyen <dinguyen@kernel.org>, Pratyush Yadav <p.yadav@ti.com>, 
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Linux I2C <linux-i2c@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>, 
 "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Konrad Adamczyk <ka@semihalf.com>, 
 Tomasz Nowicki <tn@semihalf.com>, Jacek Majkowski <jam@semihalf.com>,
 Alexandru Stan <amstan@google.com>
X-Provags-ID: V03:K1:7aEF5fGfxvWvSYh6gWtfyTu1whUCp5puMARqA/ML+oJvK3xi3LF
 7FyyyCQrJ1lfHcLmtGCHtb0zrxd/3j3pzMYGi8F11UIUniRI9NhfaIGOnOu77OJoPDDYr6a
 wawSYgJ8V87l1Do0kWGCPjc4IarMXaKO4UD6inTxdJ4bK4PTKGoVWQD4JraNrFKdWioU6NG
 CaqoLbYKGaFLYRD4uDWsg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tGv7rAXP3pw=:Nv4b2cBxkWh5QsDLzfYKDY
 6rwxJgj8XBOp6ZjBL5pjJUU3M7HyiP93COq+1j53EMYutWsy5bxcAb51xScpAGUSOC+XjKAgO
 cYXmvYFlC1LNOwk2SKvh0tziRUizpkuYr+PgUPEijBHKspsKP7PvF1TbhbUBxAyIbQfYSgPmf
 FD1hlddnTay5U9Sf8dNksb6Ujy7WkNs2JnJRXHymQ0TN6SbaoSbKAw7W8w9C6Cp2YitBCR1YN
 p0vD6apVZjzQKCvdAgTCIcNSTIUqiJbx55oWlVkwiFSTqx9FovP/FeRRJETKXNWmjlGC30cKV
 H7lCBivXnAFVAj8DXSqL82+Fz7oH7PWBdpPOOoHNaJJf4pdBdnNfjwml5/Rbh6c3U1iz6b+WO
 cCVFcr8KqgcYvEB1FIXDUOnmxSQHd65vFB7oeWsWyO+0oc5KGyKuczqp/SKD6bcf/j1UcdVZS
 2ekbKjLbIzC4HUJ38bazq+9t4xQoPgCybEh5SGK3gxmmt9dbWpsfKLWe+42Vt2T912E4LcJLR
 xWKLIGLa0iweFh4Q4/arrsp58deQdb4u5s/VcQiqMpixqaFh5BKQgXie/YdEv7mKBRYJNdOuO
 ZyA7Y77W7gS3i3JPsUfIhaz07t08ORBst4QLngq9vmKM8arwhZ5hvlzI+Q4wD02yCsRSex/4G
 zZFtP72dSvmM1PybwL2nmAVsLPgnabuUntGc/YPMaL0m1888HmKuKS8LVIY1clDiXOpx9bFhd
 ushF55Oma8giLJPngKFP0/SiITzUU5VKXTaE0w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_024137_486237_76199F02 
X-CRM114-Status: GOOD (  24.34  )
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
Message-ID: <20211006094117.AQee7MSq4c78svBS2Xfh4K4zh5TGQHOfUAbB4byqcCc@z>

T24gV2VkLCBPY3QgNiwgMjAyMSBhdCAxMToyMSBBTSBQYXdlxYIgQW5pa2llbCA8cGFuQHNlbWlo
YWxmLmNvbT4gd3JvdGU6Cj4gT24gVHVlLCBPY3QgNSwgMjAyMSBhdCA2OjI4IFBNIEFsZXhhbmRy
ZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4+Cj4+IFdo
YXQgaGFwcGVucyB3aGVuIHR3byBub2RlcyBoYXZlIHRoZSBzYW1lIGJ1c25vIHByb3BlcnR5IGJl
Y2F1c2UgZS5nLgo+PiBvbmUgaXMgaW4gYSBkdHNpIGFuZCB0aGUgb3RoZXIgb25lIGlzIGluIGEg
ZHRzPwo+Cj4KPiBJZiBidXNubyBpcyBzZXQsIHRoZSBhbGlhcyBpcyBpZ25vcmVkICh0aGUgY29k
ZSB0aGF0IGNoZWNrcyBhbGlhc2VzCj4gaXMgbmV2ZXIgcmVhY2hlZCkuIElmIHR3byBub2RlcyBo
YXZlIHRoZSBzYW1lIGJ1c25vIHByb3BlcnR5LCB3ZSBnZXQKPiBhIFdBUk4gaW4gZHJpdmVycy9p
MmMvaTJjLWNvcmUtYmFzZS5jOjE2MzcsIGFuZCBvbmx5IG9uIG9mIHRoZW0KPiBnZXRzIGF0dGFj
aGVkLgo+Cj4gV2hhdCBpcyBhIGJldHRlciB3YXkgb2YgZG9pbmcgdGhpcyB0aGVuPyBJcyBhZGRp
bmcgYWxpYXNlcyB0byB0aGUKPiBkZXZpY2V0cmVlIGxpa2UgdGhpcyBva2F5Pwo+Cj4gYWxpYXNl
cyB7Cj4gLi4uCj4gaTJjMCA9ICZpMmMwOwo+IGkyYzEgPSAmaTJjMTsKPiB9OwoKWWVzLCB0aGlz
IGlzIHRoZSBub3JtYWwgd2F5IHRvIGRvIGl0LgoKVGhlIHdheSBJIHRlbmQgdG8gdGhpbmsgb2Yg
aXQgaXMgdGhhdCB0aGUgc29jLmR0c2kgZmlsZSBjb250YWlucyBhIGRlc2NyaXB0aW9uCm9mIGhh
cmR3YXJlIHRoYXQgZXhpc3RzIGluc2lkZSBvZiB0aGUgY2hpcCBhbmQgaXMgYXMgbXVjaCBhcyBw
b3NzaWJsZQpkZXRhY2hlZCBmcm9tIGhvdyBhbiBPUyB1c2VzIGl0IG9yIHdoYXQgaXMgY29ubmVj
dGVkIHRvIGl0IG9uIHRoZQpvdXRzaWRlLiBZb3UgdGhlbiBoYXZlIHRoZSBib2FyZC5kdHMgZmls
ZSB0aGF0IGNvbnRhaW5zIGV2ZXJ5dGhpbmcgc3BlY2lmaWMKdG8gdGhlIGJvYXJkLgoKVGhlIC9j
aG9zZW4gYW5kIC9hbGlhc2VzIG5vZGVzIGluIHR1cm4gYXJlIHNwZWNpZmljIHRvIHRoZSBpbmRp
dmlkdWFsCm1hY2hpbmUsIGJhc2VkIG9uIGxvY2FsIGNvbmZpZ3VyYXRpb24sIGluc3RhbGxlZCBP
UyBhbmQgYm9vdCBsb2FkZXIsCmFuZCBob3cgdGhlIGRldmljZXMgb24gdGhlIGJvYXJkIGFyZSB1
c2VkLgoKV2UgdGVuZCB0byBoYXZlIHRoZSAvYWxpYXNlcyBub2RlIHBvcHVsYXRlZCB3aXRoIGEg
c2Vuc2libGUgY29uZmlndXJhdGlvbgpvZiBob3cgd2UgZXhwZWN0IHRoZW0gdG8gYmUgdXNlZCBm
b3IgYSBnaXZlbiBib2FyZC4gU28gaWYgeW91ciBtYWNoaW5lCmNvbm5lY3RzIHR3byBvZiB0aGUg
aW50ZXJuYWwgaTJjIGJ1c2VzIG9uIHRoZSBTb0MsIGl0IG1ha2VzIHNlbnNlIHRvIGFzc2lnbgp0
aGVtIHRoZSBhbGlhc2VzIGkyYzAgYW5kIGkyYzEuIE9uIHRoZSBvdGhlciBoYW5kLCBpZiBvbmUg
b2YgdGhlbSBpcwpub3QgY29ubmVjdGVkIGFueXdoZXJlLCB5b3UgbWF5IHNraXAgdGhhdCwgb3Ig
aWYgdGhlcmUgaXMgYW4gYWRkaXRpb25hbAppMmMgY29udHJvbGxlciBpbiBwcm9ncmFtbWFibGUg
bG9naWMgb3IgYmVoaW5kIHNvbWUgZ3BpbyBsaW5lcywgeW91IGNhbgptYWtlIHRoYXQgeW91ciBp
MmMwIGFsaWFzLgoKICAgICAgQXJuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
