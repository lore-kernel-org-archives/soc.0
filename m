Return-Path: <SRS0=h3nq=LQ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2499CC49EAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jun 2021 07:44:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE3706112D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jun 2021 07:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE3706112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lZidPA2YJ3oVfLhcR1GQF7bJfGuv43anLOBttBokKh8=; b=OKk+MpsdNQlvCm
	qVAetMnNmmbNuWMVUd8CSV3wSZ8q/X48LdU5JBdhwr1Pq20EKXuIiLf5Uj0FblKGGq1+5lqxe90OX
	KlcuYpIR33JdQPWyzq/ZL5CiWw0ecJuMKhtHuVAbSrgrEkg3uytO6PlhVFV+rANHbL2jXIUvVhDN+
	gFUrXd78R3rnzMT+b9lfx6eUmkQURPQRwDyHsNCGRX5xU9JzNOmkx23lBnkXnaTCRNnTzbAtE7mpE
	0CiFiRvKV/blYodSACvcGcUB3coT7hBcq97AbPpAAacOi59byowyEqDDSJatuEOOCABA7O+K4HlTY
	OsGjKrbuy6c400vo7KjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvb3L-0064PX-NB; Tue, 22 Jun 2021 07:42:35 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvb3G-0064Og-QE
 for linux-arm-kernel@lists.infradead.org; Tue, 22 Jun 2021 07:42:32 +0000
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MTAJr-1lqTxT10lL-00Udk8 for <linux-arm-kernel@lists.infradead.org>; Tue, 22
 Jun 2021 09:42:28 +0200
Received: by mail-wr1-f47.google.com with SMTP id d11so20054068wrm.0
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 22 Jun 2021 00:42:28 -0700 (PDT)
X-Gm-Message-State: AOAM5308cDVLnfrJ2dcVGnEFtWUfR+lVncVpkQ+n9dUBWy7e6u7qy+41
 mkRrs1XpdzFb/pKUuvb+Wptu52hLo/U2lXtaL9Y=
X-Google-Smtp-Source: ABdhPJyKvKuJF/dWQppGTkZZQVXvZbZUieWdyo+mrwK6HDTCF2UYRTAfX4ZpVRLzPLA/AqN/ajXhtSjb0V7cwDLBIBA=
X-Received: by 2002:adf:f80a:: with SMTP id s10mr3001421wrp.165.1624347747989; 
 Tue, 22 Jun 2021 00:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210621202131.127802-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20210621202131.127802-1-u.kleine-koenig@pengutronix.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 22 Jun 2021 09:40:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1Xx9JCpqQN+jBkz872jMy4i1zvROESnVYEpUgD2BxQKA@mail.gmail.com>
Message-ID: <CAK8P3a1Xx9JCpqQN+jBkz872jMy4i1zvROESnVYEpUgD2BxQKA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Drop ARM/VT8500 entry
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Alexey Charkov <alchark@gmail.com>, SoC Team <soc@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>
X-Provags-ID: V03:K1:rYAZEOOzRt2ct3m66MuAq6wRZoyWb9R/VcZcQXGWtsUS9J2nabz
 B7QSNUDkf80bFV3iK0iww/b5oOfY+Q31Mexy6pj+jfcAHGSdfeJ1kYdwkjospo0Uv1SwXyv
 2s7iVvDAgrYML9DQ2y5/MNZc318e744Fv09I0OzOKwGI+eG5ETgZnPe3SboTWB5lJu52A3S
 Mlvd1F1/KhNsgRzmuO80A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JRKWCt6FiVU=:LeqhGW1GG1usNfe/LqCheS
 TcSGNWLIqCJb8UeI4IcThKiOcPRuOcgLjoO6iVyN+Hg9Hg/2JU1TF/j4tzUtXgjpzdABe0xlc
 sonmGnm3lLSjjvP4Ql7UWx4AvcNvspqhmQ9xQvhu9PyIdedAktUWfmnDVpg5Kyzb/ekrDbZAl
 6JD/dJ1kbs18Xr0R9Z3+pVjYFdOqk2RDaEAVvGWFkUgZOlwGqzcIT+i3cG+RfwcmmKmDPzT0e
 1jd3Pz9YR61wVHhOfU6nQjMw97fKPnBYah1fzzaozDeQHS9ucgR9zGQyatSXdi8c9sWIz07us
 CdiuChpaD7DiAr4UDnMG+otwFTbp/xKi2x7s9KtMTE8DTeyS5Vc0EL6aBJXvlNaAt6CNSYEqp
 RmydNYyYSDEnZpYGzhybMWRNuPXjUfw6wOPlu8Vl+MACwnwdk4ca/6e78gd1EX9K2OtPxSQci
 TmOLesAzbM0VSMf6uWjr/v2t/oaeFOn07IoEWu30+5XzSvY98lnvLU+BNZujGj2kFKwBmR+yz
 y7YthSl7K3SDBBB/qZ8Jxw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_004231_191386_4E866BFA 
X-CRM114-Status: GOOD (  16.67  )
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
Message-ID: <20210622074009.bQyagXvnQyDOwLvI14DRlDdp1brTbUELR7-06lR4pUk@z>

T24gTW9uLCBKdW4gMjEsIDIwMjEgYXQgMTA6MjEgUE0gVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4KPiBUb255J3MgZW1haWwgYWRkcmVz
c2VzIGJvdW5jZXMgc2luY2UgYXQgbGVhc3QgSmFudWFyeSAyMDIxIGFuZCBBbGV4ZXkKPiBDaGFy
a292IGNsYWltcyBhbHJlYWR5IHRoZW4gaGUgd2FzIE1JQSBmb3IgcXVpdGUgYSB3aGlsZS4gU28g
ZHJvcCB0aGUKPiBlbnRyeS4KPgo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1
LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4gLS0tCj4KPiBkaWZmIC0tZ2l0IGEvTUFJ
TlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+IGluZGV4IGJkN2FmZjBjMTIwZi4uYjU5MzA4YTc2NDZj
IDEwMDY0NAo+IC0tLSBhL01BSU5UQUlORVJTCj4gKysrIGIvTUFJTlRBSU5FUlMKPiBAQCAtMjcy
NiwyNCArMjcyNiw2IEBAIFM6ICAgICAgIE1haW50YWluZWQKPiAgRjogICAgIGFyY2gvYXJtL21h
Y2gtcHhhL2luY2x1ZGUvbWFjaC92cGFjMjcwLmgKPiAgRjogICAgIGFyY2gvYXJtL21hY2gtcHhh
L3ZwYWMyNzAuYwo+Cj4gLUFSTS9WVDg1MDAgQVJNIEFSQ0hJVEVDVFVSRQo+IC1NOiAgICAgVG9u
eSBQcmlzayA8bGludXhAcHJpc2t0ZWNoLmNvLm56Pgo+IC1MOiAgICAgbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnIChtb2RlcmF0ZWQgZm9yIG5vbi1zdWJzY3JpYmVycykKPiAt
UzogICAgIE1haW50YWluZWQKPiAtRjogICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9pMmMvaTJjLXdtdC50eHQKPiAtRjogICAgIGFyY2gvYXJtL21hY2gtdnQ4NTAwLwo+IC1G
OiAgICAgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci12dDg1MDAuYwo+IC1GOiAgICAgZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy13bXQuYwo+IC1GOiAgICAgZHJpdmVycy9tbWMvaG9zdC93bXQtc2Rt
bWMuYwo+IC1GOiAgICAgZHJpdmVycy9wd20vcHdtLXZ0ODUwMC5jCj4gLUY6ICAgICBkcml2ZXJz
L3J0Yy9ydGMtdnQ4NTAwLmMKPiAtRjogICAgIGRyaXZlcnMvdHR5L3NlcmlhbC92dDg1MDBfc2Vy
aWFsLmMKPiAtRjogICAgIGRyaXZlcnMvdXNiL2hvc3QvZWhjaS1wbGF0Zm9ybS5jCj4gLUY6ICAg
ICBkcml2ZXJzL3VzYi9ob3N0L3VoY2ktcGxhdGZvcm0uYwo+IC1GOiAgICAgZHJpdmVycy92aWRl
by9mYmRldi92dDg1MDBsY2RmYi4qCj4gLUY6ICAgICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3dtODUw
NWZiKgo+IC1GOiAgICAgZHJpdmVycy92aWRlby9mYmRldi93bXRfZ2Vfcm9wcy4qCj4gLQoKSSB3
b3VsZCBwcmVmZXIgdG8gbGVhdmUgdGhlIGVudHJ5IGluIHBsYWNlIGFuZCBqdXN0IHJlbW92ZSBU
b255J3MgbmFtZSBoZXJlLAplaXRoZXIgYWRkaW5nIEFsZXhleSB3aXRoICJTOiBPZGQgRml4ZXMi
IChvciBldmVuIG1vcmUgaWYgaGUgd2FudHMpLCBvcgpsZWF2aW5nIGl0IGFzIG9ycGhhbmVkLiBU
aGF0IHdheSB3ZSBjYW4gZG91YmxlLWNoZWNrIGFnYWluc3QgdGhlIGZpbGUgbGlzdAp3aGVuIHdl
IGV2ZW50dWFsbHkgcmVtb3ZlIHRoZSBwbGF0Zm9ybSBjb21wbGV0ZWx5LgoKICAgICAgIEFybmQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFy
bS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1r
ZXJuZWwK
