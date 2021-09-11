Return-Path: <SRS0=hxhK=OB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3693C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Sep 2021 12:22:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 938C9611AD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Sep 2021 12:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 938C9611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XyHh5YEi2l5Wi2AD+1s63jDGoqNKcWwW+JYOelakRMc=; b=AAxreN7HbyPvj9
	mSHreCleJaadZCyVw/FT8y2KQar5j8687jwSqbeNmMp3lkw2FpFWL2GpPALcu132IuaOABEqbe103
	XvNdza1X619sd1izilr1pSYXosHx4twDz+yP+BeUHVad9sDpzP56TjqqlS8pSOHvyPleIaQlMbFQB
	AkBrfoAtNKG+Wliwaarphiqcc2/aflm+vxWmM0Mxpj5bGs23XS6lp1YxQlcmSiUyrL+M6aJjR++95
	m5JvoL/c0CGATl2Y4HZ6A3Oy02rI6RCokFB5cVNF7N9VdjAEfcgJyOEelj9mfD1w38yX+rfsNkfd2
	3X9nUgaSvA0W2jpXEfZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mP1zS-00EmP8-64; Sat, 11 Sep 2021 12:20:14 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mP1zM-00EmO7-Gk
 for linux-arm-kernel@lists.infradead.org; Sat, 11 Sep 2021 12:20:12 +0000
Received: by mail-vs1-xe31.google.com with SMTP id p24so2210183vsg.0
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 11 Sep 2021 05:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7H4xpqYSY81qruCKg0gMtRjcT5K5rttH7wg/f9oDRUM=;
 b=EjO+h+qRdpbAaxSWbNySY0QHC1aHKW7nV63e4IqtLrd636xgC/5uI+LtnX69vgv0wx
 XJUILMykuNMsKd+JQRY7VEYrGKnKytB+LHSkmoC2sgf9U3WQ3lpoxM6jqgabw01fOqSV
 aPyoRXE1I+uuZInytFq6ZMW9wC9m9XVqbOVi2Xe2Nf+EIT6TPJIwCW2MSM9G7KP3o23p
 lPicPE5P2YpprhhSTM3AJa3F61nDbAuXHIHT3ZbhdXIFbPSpkmL83BKOJPQ79uEvohMP
 W6lDSC3YZe+2fE4kOjj4MRn6V0TMXY2QbR/lONQmIP6HRASOqyvzufMxTMlyTeNOmnXQ
 LUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7H4xpqYSY81qruCKg0gMtRjcT5K5rttH7wg/f9oDRUM=;
 b=OGr50engkXOaQnpBdXEHgNIpTpRCWTil0t+opVUehVwU3eN382AwHjsk/V0QaLYtdM
 i12yEAtVoR+oJb5v4uvsCKTEagyUB7Ix7vTl9KWyhH78hVV3zZsla+GS4Cidg1Qq9zMS
 tZfummDriFyti9ili7bTJ3XSrP5mvOqG4p+PFs1XkmWdWevKkG+uqwEMlliDOsQmOOzs
 JKvvfaJW3jqC1HvY1q/dpFWMHaHz4uvfCLxOWtFjaqqiDyJDpV5LW9NHG/YenUFaDj6l
 a9QEGFe9S9qrGRmdsS6VQLX1sldJ7mV/ebsIsrS0+AlyEsQNh0fwwmPIlNsGEEtLvEzK
 wrLg==
X-Gm-Message-State: AOAM533yajlg8prCMDcMoXBZVyFTF2GAw/8CKxKHnLUg0TYbsvdk4IoX
 EMDeK3gF8KBDhrRVE2RrNK5eRMGQGjgkrmovhXw=
X-Google-Smtp-Source: ABdhPJwx8ta3pvKIUZJBToP9h/NasPw2m0chELd5Fz7tfkbqg/HunG1xeb+C+1VTrJrxG0KT4myBNizMQaCNb+rNFsI=
X-Received: by 2002:a67:ef85:: with SMTP id r5mr756445vsp.32.1631362804642;
 Sat, 11 Sep 2021 05:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210910190322.27058-1-romain.perier@gmail.com>
 <20210910190322.27058-3-romain.perier@gmail.com>
 <CAFr9PXmRXcu_ifE62dT5AwZv2uFbYVfAc5ZX5qBoRkEPKGB+JA@mail.gmail.com>
In-Reply-To: <CAFr9PXmRXcu_ifE62dT5AwZv2uFbYVfAc5ZX5qBoRkEPKGB+JA@mail.gmail.com>
From: Romain Perier <romain.perier@gmail.com>
Date: Sat, 11 Sep 2021 14:19:53 +0200
Message-ID: <CABgxDoLBbD8P-PhRH+SmuuQ8jNR53Ti=8brFL3NXMmiotXU5ww@mail.gmail.com>
Subject: Re: [PATCH 2/4] ARM: dts: mstar: Add the Wireless Tag
 IDO-SBC2D06-V1B-22W
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 DTML <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210911_052008_609457_375D06AC 
X-CRM114-Status: GOOD (  24.41  )
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
Message-ID: <20210911121953.mlR9YmwioU31zCrhfzJJ30Nc146d4Zpow05SFhNnseg@z>

SGkgRGFuaWVsLAoKQWNrLCBJIHdpbGwgZml4IGl0IChyZW1vdmUgImNvbW1vbiIgZnJvbSB0aGUg
ZmlsZSBuYW1lIGFuZCB0aGUgdW5uZWVkZWQgc3BhY2UpCgpUaGFua3MsClJvbWFpbgoKTGUgc2Ft
LiAxMSBzZXB0LiAyMDIxIMOgIDA1OjE4LCBEYW5pZWwgUGFsbWVyIDxkYW5pZWxAMHgwZi5jb20+
IGEgw6ljcml0IDoKPgo+IEhpIFJvbWFpbiwKPgo+IE9uIFNhdCwgMTEgU2VwdCAyMDIxIGF0IDA0
OjAzLCBSb21haW4gUGVyaWVyIDxyb21haW4ucGVyaWVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiAr
ICAgICAgICAgICAgICAtIHdpcmVsZXNzdGFnLGlkby1zb20yZDAxICMgV2lyZWxlc3MgVGFnIElE
Ty1TT00yRDAxCj4gPiArICAgICAgICAgICAgICAtIHdpcmVsZXNzdGFnLGlkby1zYmMyZDA2LXYx
Yi0yMncgIyBXaXJlbGVzcyBUYWcgSURPLVNCQzJEMDYtMVZCLTIyVwo+Cj4gRm9yIGFueW9uZSB3
b25kZXJpbmcgd2h5IHdlIGhhdmUgdHdvIHN0cmluZ3MgaGVyZToKPiBUaGUgU0JDIGJvYXJkIGlz
IG1hZGUgdXAgb2YgYSBTb00gYW5kIGEgYm9hcmQgd2l0aCB0aGUgY29ubmVjdG9ycy4KPiBUaGUg
U29NIGNvdWxkIGJlIHVzZWQgc3RhbmRhbG9uZSBzbyB3ZSBtaWdodCBhcyB3ZWxsIGhhdmUgYSBj
b21wYXRpYmxlCj4gZm9yIGl0IHRvby4KPiBXZSBoYXZlIHNvbWUgZHRzaXMgZm9yIHRoZSBTb00g
YnV0IHJlYWxseSB0aG9zZSBjb3VsZCBiZSBidWlsdCBhcyBpcwo+IHRvIHN1cHBvcnQgc29tZW9u
ZSB1c2luZyB0aGUgU29NIG9uIGl0J3Mgb3duLgo+Cj4gPiArKysgYi9hcmNoL2FybS9ib290L2R0
cy9tc3Rhci1pbmZpbml0eTJtLXNzZDIwMS1zb20yZDAxLWNvbW1vbi5kdHNpCj4KPiBGb3IgYW55
b25lIHdvbmRlcmluZzoKPgo+IFRoZSBzb20yZDAxIGNhbiBjb21lIHdpdGggYW4gU1NEMjAxICg2
NE1CIEREUjIgaW50ZWdyYXRlZCkgb3IgU1NEMjAyRAo+ICgxMjhNQiBERFIzIGludGVncmF0ZWQp
IGFuZCB0aGV5IG5lZWQgZGlmZmVyZW50IGZpeGVkIHJlZ3VsYXRvcnMgZm9yCj4gdGhlIEREUiBz
dXBwbHkuCj4gU28gd2UgaGF2ZSBhIGNvbW1vbiBkdHNpIGFuZCB0aGVuIG92ZXJyaWRlIHRoZSBy
ZWd1bGF0b3IgaW4gYW5vdGhlcgo+IGxheWVyIG9mIGR0c2kgZm9yIHRoZSBTU0QyMDJEIHZlcnNp
b24uCj4KPiBUaGlua2luZyBhYm91dCBpdCBub3cgSSB0aGluayB3ZSBjYW4gZHJvcCBjb21tb24g
ZnJvbSB0aGUgZmlsZSBuYW1lLgo+Cj4gPiBAQCAtMCwwICsxLDIxIEBACj4gPiArLy8gU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIgT1IgTUlUCj4gPiArLyoKPiA+ICsg
KiBDb3B5cmlnaHQgKGMpIDIwMjEgdGhpbmd5LmpwLgo+ID4gKyAqIEF1dGhvcjogRGFuaWVsIFBh
bG1lciA8ZGFuaWVsQHRoaW5neS5qcD4KPiA+ICsgKiBBdXRob3I6IFJvbWFpbiBQZXJpZXIgPHJv
bWFpbi5wZXJpZXJAZ21haWwuY29tPgo+ID4gKyAqLwo+ID4gKwo+ID4gKy8gewo+ID4gKwo+Cj4g
VW5uZWVkZWQgc3BhY2UuCj4KPiA+ICsgICAgICAgcmVnX3ZjY19kcmFtOiByZWd1bGF0b3ItdmNj
LWRyYW0gewo+ID4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVk
IjsKPiA+ICsgICAgICAgICAgICAgICByZWd1bGF0b3ItbmFtZSA9ICJ2Y2NfZHJhbSI7Cj4gPiAr
ICAgICAgICAgICAgICAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MTgwMDAwMD47Cj4gPiAr
ICAgICAgICAgICAgICAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MTgwMDAwMD47Cj4gPiAr
ICAgICAgICAgICAgICAgcmVndWxhdG9yLWJvb3Qtb247Cj4gPiArICAgICAgIH07Cj4gPiArfTsK
PiA+ICsKPiA+ICsmcG1fdWFydCB7Cj4gPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiA+ICt9
Owo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL21zdGFyLWluZmluaXR5Mm0tc3Nk
MjAyZC13aXJlbGVzc3RhZy1pZG8tc2JjMmQwNi12MWItMjJ3LmR0cyBiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL21zdGFyLWluZmluaXR5Mm0tc3NkMjAyZC13aXJlbGVzc3RhZy1pZG8tc2JjMmQwNi12MWIt
MjJ3LmR0cwo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4u
MjBiNDBiNzExZDRmCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9hcmNoL2FybS9ib290L2R0
cy9tc3Rhci1pbmZpbml0eTJtLXNzZDIwMmQtd2lyZWxlc3N0YWctaWRvLXNiYzJkMDYtdjFiLTIy
dy5kdHMKPiA+IEBAIC0wLDAgKzEsMjMgQEAKPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMC1vci1sYXRlciBPUiBNSVQKPiA+ICsvKgo+ID4gKyAqIENvcHlyaWdodCAoYykg
MjAyMSB0aGluZ3kuanAuCj4gPiArICogQXV0aG9yOiBEYW5pZWwgUGFsbWVyIDxkYW5pZWxAdGhp
bmd5LmpwPgo+ID4gKyAqIEF1dGhvcjogUm9tYWluIFBlcmllciA8cm9tYWluLnBlcmllckBnbWFp
bC5jb20+Cj4gPiArICovCj4gPiArCj4gPiArL2R0cy12MS87Cj4gPiArI2luY2x1ZGUgIm1zdGFy
LWluZmluaXR5Mm0tc3NkMjAyZC13aXJlbGVzc3RhZy1pZG8tc29tMmQwMS5kdHNpIgo+ID4gKyNp
bmNsdWRlIDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4KPiA+ICsKPiA+ICsvIHsKPiA+ICsgICAg
ICAgbW9kZWwgPSAiV2lyZWxlc3MgVGFnIElETy1TQkMyRDA2LTFWQi0yMlciOwo+ID4gKyAgICAg
ICBjb21wYXRpYmxlID0gIndpcmVsZXNzdGFnLGlkby1zYmMyZDA2LXYxYi0yMnciLCAid2lyZWxl
c3N0YWcsaWRvLXNvbTJkMDEiLCAibXN0YXIsaW5maW5pdHkybSI7Cj4gPiArCj4gPiArICAgICAg
IGxlZHMgewo+ID4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZ3Bpby1sZWRzIjsKPiA+
ICsgICAgICAgICAgICAgICBzeXNfbGVkIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGdw
aW9zID0gPCZncGlvIFNTRDIwWERfR1BJT19HUElPODUgR1BJT19BQ1RJVkVfTE9XPjsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGxpbnV4LGRlZmF1bHQtdHJpZ2dlciA9ICJoZWFydGJlYXQi
Owo+ID4gKyAgICAgICAgICAgICAgIH07Cj4gPiArICAgICAgIH07Cj4gPiArfTsKPiA+IGRpZmYg
LS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9tc3Rhci1pbmZpbml0eTJtLXNzZDIwMmQtd2lyZWxl
c3N0YWctaWRvLXNvbTJkMDEuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL21zdGFyLWluZmluaXR5
Mm0tc3NkMjAyZC13aXJlbGVzc3RhZy1pZG8tc29tMmQwMS5kdHNpCj4gPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi4wNjU2N2E1MjE5YzUKPiA+IC0tLSAvZGV2
L251bGwKPiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL21zdGFyLWluZmluaXR5Mm0tc3NkMjAy
ZC13aXJlbGVzc3RhZy1pZG8tc29tMmQwMS5kdHNpCj4gPiBAQCAtMCwwICsxLDI4IEBACj4gPiAr
Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIgT1IgTUlUCj4gPiAr
LyoKPiA+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjEgdGhpbmd5LmpwLgo+ID4gKyAqIEF1dGhvcjog
RGFuaWVsIFBhbG1lciA8ZGFuaWVsQHRoaW5neS5qcD4KPiA+ICsgKiBBdXRob3I6IFJvbWFpbiBQ
ZXJpZXIgPHJvbWFpbi5wZXJpZXJAZ21haWwuY29tPgo+ID4gKyAqLwo+ID4gKwo+ID4gKy9kdHMt
djEvOwo+ID4gKyNpbmNsdWRlICJtc3Rhci1pbmZpbml0eTJtLXNzZDIwMmQuZHRzaSIKPiA+ICsj
aW5jbHVkZSAibXN0YXItaW5maW5pdHkybS1zc2QyMDEtc29tMmQwMS1jb21tb24uZHRzaSIKPiA+
ICsKPiA+ICsvIHsKPiA+ICsgICAgICAgbW9kZWwgPSAiV2lyZWxlc3MgVGFnIElETy1TT00yRDAx
IChTU0QyMDJEKSI7Cj4gPiArICAgICAgIGNvbXBhdGlibGUgPSAid2lyZWxlc3N0YWcsaWRvLXNv
bTJkMDEiLCAibXN0YXIsaW5maW5pdHkybSI7Cj4gPiArCj4gPiArICAgICAgIGFsaWFzZXMgewo+
ID4gKyAgICAgICAgICAgICAgIHNlcmlhbDAgPSAmcG1fdWFydDsKPiA+ICsgICAgICAgfTsKPiA+
ICsKPiA+ICsgICAgICAgY2hvc2VuIHsKPiA+ICsgICAgICAgICAgICAgICBzdGRvdXQtcGF0aCA9
ICJzZXJpYWwwOjExNTIwMG44IjsKPiA+ICsgICAgICAgfTsKPiA+ICt9Owo+ID4gKwo+ID4gKyZy
ZWdfdmNjX2RyYW0gewo+ID4gKyAgICAgICByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwxNTAw
MDAwPjsKPiA+ICsgICAgICAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MTUwMDAwMD47Cj4g
PiArfTsKPiA+IC0tCj4gPiAyLjMzLjAKPiA+Cj4KPiBDaGVlcnMsCj4KPiBEYW5pZWwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJu
ZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
