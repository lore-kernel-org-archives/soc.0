Return-Path: <SRS0=hxhK=OB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B98C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Sep 2021 12:22:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E07F760FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Sep 2021 12:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E07F760FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y6zP/7F0gzc4UtK1ZuGGKdxLThd9rxqSFCDNKjwJajY=; b=AMVxRIBpLkyuAd
	wESRFbOFzBN4VckP1JiKNBEPOkRTw9BeugxyUzLGmAgzvDPUXZqIzlVriiZaqcabzepN2YRg+qQLB
	MwqUqa7XyQLvJyO9FjIF3xEvWnEMAi2H4QbZg1fFmF94tR+u1w5DH67bSo7RX0VPzFTG32OYDcKbI
	5JV4hMxqCpBgIGPuvo43lDxIMhe9F/1Ui+nq+vV8WTGQ9HNs3NqY4teSodvQaf2Bh+I01Drv/27ST
	p0zro2K/mOaal2SOQTR4uv6M8gEn4K4pI2oKXXe2dRi9vUzUFrWfsZfIm44FSgy+2KdAZU46WeBF4
	HB6Jk2gLeqS65NkhZZBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mP20S-00EmVD-LE; Sat, 11 Sep 2021 12:21:16 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mP20P-00EmTv-9O
 for linux-arm-kernel@lists.infradead.org; Sat, 11 Sep 2021 12:21:14 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id k124so1620092vke.5
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 11 Sep 2021 05:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JFcWtn6lUh5qSG7OOiLxD5ZahmIxrMGf1j5Q5s8lXfU=;
 b=ooYnU0AqSisGN9gV0Nwzw8AH4IeUcF8jgJbCHu0G/PUcShcVArw2J6lI2X4Ms4B2My
 VpvWZfww5r2EQVNIv1MC3z7HRTimN0vh8BfUVCXbih0m78iAIFaPRrSfjdn3tmCCVYec
 tKSNWscw2gSKm14wIE7CFOR5w1kPL8d8CwlKE3E0GS7QFG/OHsPep/YqMUpEXobd462U
 JG+3L/mknZJR5/6b8wFabqtBlBeEuZkVmV/PhtwOw/ToE5Mg8sFKjLfsmYBebAk4EPtU
 fGVxCh+OSqWgE5520DU5Cqy8EKC1ljmMT18ly+2QeIDL/EibCMN5fPQenbiU/SDSulAU
 Tugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JFcWtn6lUh5qSG7OOiLxD5ZahmIxrMGf1j5Q5s8lXfU=;
 b=RWyRbpcJ6T/vCkw3fcg2PHHaFWPlTXyTxAdAh5reSF53vS9cat4DyN0kRTgchVD5pb
 mhFbcpTC1NBNIvU+kMZ3kkJRiYU+h6RjjfctRSVFBq6IOR4OoshfXK81DCXe9g0+FBgu
 TF2QgUTlhqMI9lgwxFK27M3sh4dgcGaP6xP4NboTlCQj+ruexcC+oJDJZReFemtZQYF/
 p2j7vKis+KOt2sMFbUKGPFK8zSJSVpsZ5cWt0qd55BMshUuiNHNBT1idFgYO/0etUEXR
 hzbK+F997JzIU7aRNbsHQclRzS+DPuHQlrdM6NZrKgzKw8k/f8krPrZcFEyXFQpAvH9a
 HXOg==
X-Gm-Message-State: AOAM532Hfr8BhRxjavQ4NhJEmar4x0hVo8vuDGoofXKzTLG+95zjd6xc
 7RGNhVhXXm8rYtrwvsSxE+vAD1Npd5QpMtLApTc=
X-Google-Smtp-Source: ABdhPJwrH1e4m8h6HaHj1QK9JEMdnD/N4f+EvyVU7cY41tx7OAAFn/bJT6S+BdYNEzFERGS/IXAURi3UdeeLL+l6HTI=
X-Received: by 2002:a1f:9e11:: with SMTP id h17mr785852vke.16.1631362869518;
 Sat, 11 Sep 2021 05:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210910190322.27058-1-romain.perier@gmail.com>
 <20210910190322.27058-4-romain.perier@gmail.com>
 <CAFr9PXmwRDfXmDR9UOGoQ2+_LDaSGgmg7n=Ek4RtBdiC2kfuLA@mail.gmail.com>
In-Reply-To: <CAFr9PXmwRDfXmDR9UOGoQ2+_LDaSGgmg7n=Ek4RtBdiC2kfuLA@mail.gmail.com>
From: Romain Perier <romain.perier@gmail.com>
Date: Sat, 11 Sep 2021 14:20:58 +0200
Message-ID: <CABgxDo+9WnjE5pu=ijN01htLucFYko--w2fJ+ZVazBg_cSLZ1w@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: add vendor prefix for Wireless Tag
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 DTML <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210911_052113_356914_CA1DDE1E 
X-CRM114-Status: GOOD (  20.89  )
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
Message-ID: <20210911122058.1QibK7bSO8D1CnKmHwsH_7kMRLwBwVaKeULAbmLi3_M@z>

SGkgRGFuaWVsLAoKTGUgc2FtLiAxMSBzZXB0LiAyMDIxIMOgIDA0OjU5LCBEYW5pZWwgUGFsbWVy
IDxkYW5pZWxAMHgwZi5jb20+IGEgw6ljcml0IDoKPgo+IEhpIFJvbWFpbiwKPiBTb3JyeSBmb3Ig
c2VuZGluZyB0aGlzIGFnYWluLiBHbWFpbCBkZWNpZGVkIHRvIHN3aXRjaCB0byBodG1sIGVtYWls
IHNvCj4gdGhlIGZpcnN0IHZlcnNpb24gYm91bmNlZCBmcm9tIHRoZSBtYWlsaW5nIGxpc3RzLgo+
Cj4gT24gU2F0LCAxMSBTZXB0IDIwMjEgYXQgMDQ6MDMsIFJvbWFpbiBQZXJpZXIgPHJvbWFpbi5w
ZXJpZXJAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBUaGlzIGFkZHMgYSB2ZW5kb3IgcHJlZml4
IGZvciB3aXJlbGVzcyB0YWcgYm9hcmRzIGFuZCBTT01zLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IFJvbWFpbiBQZXJpZXIgPHJvbWFpbi5wZXJpZXJAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sIHwgMiAr
Kwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1s
Cj4gPiBpbmRleCBhODY3ZjcxMDJjMzUuLmI1MGQ2MmRkZTdjNSAxMDA2NDQKPiA+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbAo+ID4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55
YW1sCj4gPiBAQCAtNTE3LDYgKzUxNyw4IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgo+ID4gICAgICBk
ZXNjcmlwdGlvbjogSW50ZXJuYXRpb25hbCBCdXNpbmVzcyBNYWNoaW5lcyAoSUJNKQo+ID4gICAg
Il5pY3BsdXMsLioiOgo+ID4gICAgICBkZXNjcmlwdGlvbjogSUMgUGx1cyBDb3JwLgo+ID4gKyAg
Il53aXJlbGVzc3RhZywuKiI6Cj4gPiArICAgIGRlc2NyaXB0aW9uOiBXaXJlbGVzcyBUYWcgKHFp
bWluZyB5dW5kdWFuKQo+ID4gICAgIl5pZHQsLioiOgo+ID4gICAgICBkZXNjcmlwdGlvbjogSW50
ZWdyYXRlZCBEZXZpY2UgVGVjaG5vbG9naWVzLCBJbmMuCj4gPiAgICAiXmlmaSwuKiI6Cj4gPiAt
LQo+ID4gMi4zMy4wCj4gPgo+Cj4gVGhpcyBzaG91bGQgYmUgaW4gYWxwaGFiZXRpY2FsIG9yZGVy
Lgo+IEFsc28sIHRoaXMgY29tbWl0IHNob3VsZCBiZSBiZWZvcmUgYWRkaW5nIHRoZSBEVCBmb3Ig
dGhlIGJvYXJkIEkgdGhpbmsuCj4gVGhlIHByZWZpeCBzaG91bGQgYmUgaW4gYmVmb3JlIHNvbWV0
aGluZyB0aGF0IHVzZXMgaXQuCj4KPiBUaGFua3MsCgpBY2ssIEkgd2lsbCBmaXggaXQuCgpDaGVl
cnMsClJvbWFpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYXJtLWtlcm5lbAo=
