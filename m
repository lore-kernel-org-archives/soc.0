Return-Path: <SRS0=6Q0g=PJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93342C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 07:00:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5355160FC1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 07:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5355160FC1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iuEkuH+lgD+V3pMTg6Kf9Y4xAwyfvA4Q3c+b+F4ze3w=; b=WEZpbYNjRs2/vD
	doraFbrY/GBoF4Q4yQCyR0HLnBdN29YCOcroSHvGt0SFHk++ArqHf6cxruUfy+rKMZ4j7u6WioZJe
	1iV1Jk+gsZqCX9DfXRLPmeNoyjknOdT4/p0Khnqo2au6le/EG2hvpBAnB28L2vd4U9uXlKKhFdWxz
	0ANdiPwYsjziVi+9XfwXqWU2z8xR7GrjBSSRD6PFv2wgn6829H8mYN3G6HnC6nQ1wLqOiRj1TaINx
	zSl8N2heG+2/uRC5pkRlu07C608kxwPFZe1NqSxaYIAbMzdYGw8IrUN6Zj2O2kc6KsoUNRrxrhMiA
	7r783+/172NFUh7JMtSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdS2v-006beT-Pc; Thu, 21 Oct 2021 06:59:25 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdS2t-006bdz-0H
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Oct 2021 06:59:24 +0000
Received: by mail-qk1-x72f.google.com with SMTP id bl14so6083808qkb.4
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 20 Oct 2021 23:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=N//rb+m4pmHWM2In2ypTAyaR2MvFzxgR0R9cpQ84nZA=;
 b=lALUmGpxCJbC96/zmuF9gHKCXTP4nrjuxWYNttCdVFtygtabvSPcmHoo0NT3LKuMKg
 K94P752P5emkntHyXyXxbKi60kcnTjPZPWv/beOtcKrx+lkEkBqNIhlYYnaJiwqugFEZ
 wVt9FuDJ4GGnmWuCdOR4MZN3VlZPHuzTHlLjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=N//rb+m4pmHWM2In2ypTAyaR2MvFzxgR0R9cpQ84nZA=;
 b=jVuUK77Fr9KWK6PzJIv57eZ8IA3uvSSIiE+QoZaOr+UBxJjpymM7yf5oquW+BOlFnU
 Sz5cbIhuhVWMMDv6ADoZqe/khXehrox3CkshZH77NTEu88Ym3YITbT9Ms9M6TQ/WS2Ub
 pLEEQQkse1UfmgRaQwWVsijWDCOFTdBM/dFWXggQynChIP26hqKuikKduWXguIiHMCR+
 q7QErc/63ZdyNWP2D47Nr/LytAGayCw5BLW3EoMpijB8RxZPAwnq1TsMr7V29Q0LBQwv
 4oK69y2ZvNFXI41H1bg1QIurUvjajqIQ9qiHN2VoO1aXp1OX3BJsu3IQd3K7maotdyhN
 YuxQ==
X-Gm-Message-State: AOAM532y0ard5GHJ4yLg4HxJAmaShlnBOREmrswgXXCiIOZmBAAMF1d3
 /Co/8/H7z6SqZGhMXQH543WE7aTjwaJVpcibNtA=
X-Google-Smtp-Source: ABdhPJy7LpdJkyKOVfpFc2II+KybhaG4y7eBWsQMf1M8zZAqipes7m1MQxwVLb6ADiNS2ub2DlQuRD6wRcaRxUlWqEU=
X-Received: by 2002:a37:68c4:: with SMTP id d187mr3020098qkc.36.1634799562103; 
 Wed, 20 Oct 2021 23:59:22 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 21 Oct 2021 06:59:10 +0000
Message-ID: <CACPK8Xd=eAMk-S3akhGgL4i_K190Nz9t=_CrdHQMJ+nbW172mg@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.16, round 2
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_235923_072800_C0D3318F 
X-CRM114-Status: GOOD (  10.89  )
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
Message-ID: <20211021065910.pPi49JfIh3-VcFR-QqR_hphX5kwTsDXw12Omeym5ddE@z>

SGVsbG8gc29jIG1haW50YWluZXJzLAoKSG90IG9uIHRoZSBoZWVscyBvZiB5b3UgbWVyZ2luZyBt
eSBmaXJzdCBwdWxsIHJlcXVlc3QsIGhlcmUncyBhIHNlY29uZApvbmUgd2l0aCBzb21lIGNoYW5n
ZXMgSSBtaXNzZWQgdGhlIGZpcnN0IHRpbWUsIGFuZCBzb21lIHBhdGNoZXMgdGhhdApjYW1lIGlu
IHNpbmNlLgoKT2Ygbm90ZSB0aGUgdHdvIElCTSBQMTAgcGxhdGZvcm1zIG5vdyBoYXZlIGFsbCBv
ZiB0aGVpciBkZXZpY2UgdHJlZQpjaGFuZ2VzIGluIG1haW5saW5lLCBzbyB0aGF0J3MgYSBtaWxl
c3RvbmUgZm9yIHRoZW0uIFRoZXkgYXJlIG91cgpiaWdnZXN0IEFzcGVlZCBCTUMgZGV2aWNlIHRy
ZWVzLCBjb21pbmcgaW4gYXQgMjQwMCBhbmQgMzYwMCBsaW5lcyBvZgpkZXNjcmlwdGlvbi4KClRo
ZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNGViN2ZlMzMzM2EwMjFjOGQwZjM1YmNi
NWNkN2M0ZTQyODAwZGY2MjoKCiAgQVJNOiBkdHM6IGFzcGVlZDogZnA1MjgwZzI6IFVzZSB0aGUg
NjRNIGxheW91dCAoMjAyMS0xMC0xNCAxODoyNToxNyArMTAzMCkKCmFyZSBhdmFpbGFibGUgaW4g
dGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvam9lbC9ibWMuZ2l0CnRhZ3MvYXNwZWVkLTUuMTYtZGV2aWNldHJlZS0y
Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gZjkyNDFmZThiOTY1MmU2NzUxZjRhZTY4
NGVmZTAxNDhlM2MxNTdjNzoKCiAgQVJNOiBkdHM6IGFzcGVlZDogQWRkIHVhcnQgcm91dGluZyB0
byBkZXZpY2UgdHJlZSAoMjAyMS0xMC0yMSAxNjo1OTo1MyArMTAzMCkKCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQVNQRUVE
IGRldmljZSB0cmVlIHVwZGF0ZXMgZm9yIDUuMTYsIHJvdW5kIDIKCiAtIE5ldyBtYWNoaW5lczoK
CiAgKiBJbnZlbnRlYyBUcmFuc2Zvcm1lcnMsIGFuIHg4NiBmYW1pbHkgc2VydmVyIHdpdGggYW4g
QVNUMjYwMCBCTUMKCiAtIFVwZGF0ZXMgdG8gdGhlIEV2ZXJlc3QgYW5kIFJhaW5pZXIgc2Vuc29y
cywgZ3Bpb3MgYW5kIEtDUyBkZXZpY2VzCgogLSBOZXcgVUFSVCByb3V0aW5nIGRldmljZSB0cmVl
IGRlc2NyaXB0aW9uCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCkFuZHJldyBKZWZmZXJ5ICgyKToKICAgICAgQVJNOiBkdHM6
IGFzcGVlZDogcDEwYm1jOiBVc2UgS0NTIDMgZm9yIE1DVFAgYmluZGluZwogICAgICBBUk06IGR0
czogYXNwZWVkOiBwMTBibWM6IEVuYWJsZSBLQ1MgY2hhbm5lbCAyCgpCLiBKLiBXeW1hbiAoMSk6
CiAgICAgIEFSTTogZHRzOiBhc3BlZWQ6IHJhaW5pZXI6IFJlbW92ZSBQU1UgZ3Bpby1rZXlzCgpD
aGlhLVdlaSBXYW5nICgxKToKICAgICAgQVJNOiBkdHM6IGFzcGVlZDogQWRkIHVhcnQgcm91dGlu
ZyB0byBkZXZpY2UgdHJlZQoKRWRkaWUgSmFtZXMgKDcpOgogICAgICBBUk06IGR0czogYXNwZWVk
OiBwMTBibWM6IEZpeCBBREMgaWlvLWh3bW9uIGJhdHRlcnkgbm9kZSBuYW1lCiAgICAgIEFSTTog
ZHRzOiBhc3BlZWQ6IHJhaW5pZXIgYW5kIGV2ZXJlc3Q6IFJlbW92ZSBQQ0EgZ3BpbyBzcGVjaWZp
Y2F0aW9uCiAgICAgIEFSTTogZHRzOiBhc3BlZWQ6IGV2ZXJlc3Q6IEFkZCBJMkMgc3dpdGNoIG9u
IGJ1cyA4CiAgICAgIEFSTTogZHRzOiBhc3BlZWQ6IGV2ZXJlc3Q6IEFkZCBJQk0gT3BlcmF0aW9u
IFBhbmVsIEkyQyBkZXZpY2UKICAgICAgQVJNOiBkdHM6IGFzcGVlZDogZXZlcmVzdDogRml4IGJ1
cyAxNSBtdXhlZCBlZXByb21zCiAgICAgIEFSTTogZHRzOiBhc3BlZWQ6IHJhaW5pZXI6IEFkZCBl
ZXByb20gb24gYnVzIDEyCiAgICAgIEFSTTogZHRzOiBhc3BlZWQ6IHJhaW5pZXI6IFJlbW92ZSBn
cGlvIGhvZyBmb3IgR1BJT1A3CgpJc2FhYyBLdXJ0aCAoMSk6CiAgICAgIEFSTTogZHRzOiBhc3Bl
ZWQ6IHJhaW5pZXI6IEFkZCAnZmFjdG9yeS1yZXNldC10b2dnbGUnIGFzIEdQSU9GNgoKSm9lbCBT
dGFubGV5ICgyKToKICAgICAgQVJNOiBkdHM6IGFzcGVlZDogcmFpbmllcjogQWRkIGZyb250IHBh
bmVsIExFRHMKICAgICAgQVJNOiBkdHM6IGFzcGVlZDogcmFpbmllcjogRW5hYmxlIGVhcmx5Y29u
CgpMaW4uVG9tbXlTQyDmnpfkuJbmrL0gVEFPICgxKToKICAgICAgQVJNOiBkdHM6IGFzcGVlZDog
QWRkaW5nIEludmVudGVjIFRyYW5zZm9ybWVycyBCTUMKCiBhcmNoL2FybS9ib290L2R0cy9NYWtl
ZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBhcmNoL2FybS9ib290L2R0cy9h
c3BlZWQtYm1jLWlibS1ldmVyZXN0LmR0cyAgICAgICB8IDczNSArKy0tLS0tLS0tLS0tLS0tLS0t
LS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtaWJtLXJhaW5pZXIuZHRzICAgICAgIHwg
NjM0ICsrLS0tLS0tLS0tLS0tLS0tLQogLi4uL2Jvb3QvZHRzL2FzcGVlZC1ibWMtaW52ZW50ZWMt
dHJhbnNmb3JtZXJzLmR0cyAgfCAzMjggKysrKysrKysrCiBhcmNoL2FybS9ib290L2R0cy9hc3Bl
ZWQtZzQuZHRzaSAgICAgICAgICAgICAgICAgICB8ICAgNiArCiBhcmNoL2FybS9ib290L2R0cy9h
c3BlZWQtZzUuZHRzaSAgICAgICAgICAgICAgICAgICB8ICAgNiArCiBhcmNoL2FybS9ib290L2R0
cy9hc3BlZWQtZzYuZHRzaSAgICAgICAgICAgICAgICAgICB8ICAgNiArCiA3IGZpbGVzIGNoYW5n
ZWQsIDQ3MCBpbnNlcnRpb25zKCspLCAxMjQ2IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtaW52ZW50ZWMtdHJhbnNmb3JtZXJzLmR0
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJt
LWtlcm5lbAo=
