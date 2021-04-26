Return-Path: <SRS0=6ihi=JX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F5FCC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Apr 2021 15:54:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B457B60FD9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Apr 2021 15:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B457B60FD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gcP+yK33so384Cg2EaqoYJcXWnH//OPoPzNDnSqp9jI=; b=SK9JeGWSH6YeHzrkj2QYrRemBd
	99z+q+qpoTy4U/txfRPbezH2eZqJPVwUqmdH3iA7TCenkjEyJY+310XFf/xYrPfwmx4e/YLGLIbuu
	tr0Qaz0c3q54e58dRjWSbzI9XDhgYtBjawcFSmFAJg91gdcdjvpgl6wchevjGtBpa4kA9K2IAkXCQ
	GofHtGp+uAtFCwPDTY+Ze0oYi4fpPjWZp/pqbwJta2n0/jEPmuxL6DIKwMePRP4nlN4y6lJZ+B3hU
	ufGO8l616pp2bUnuiSDy93h6/Sso4siFk1jSAbaWFE0mzF13fC4t4hw5Grz2aFIn4qHrBTac86KM4
	aVQhepig==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb3Xw-0080Uj-Qg; Mon, 26 Apr 2021 15:53:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb3Xu-0080UZ-Ek
 for linux-arm-kernel@desiato.infradead.org; Mon, 26 Apr 2021 15:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=hubCPv7AyHahE0bWF0enmCI0waUQHwNnerA3A/cjXyc=; b=WaFRSBiFv0diEX3msmg1eGnWap
 2FoeIK7K+fzzSAQOLEgTYZ8HkVNOn2RHuVnr5XAKEkxFxPXK6cgALFBO9RHbHFX5gWp0j3cwsdjS0
 zh6zSn2GKle7GoLL+5H4nwvGt6Ap8aqjCQYaseWGoqJ3eDfPWiefg/MHd8jfS0GA7UcK0OuxOUtTm
 7dCKPyrTAYtqc+Qo7vPjiOKHamvoehLQ1b3+V3PP1V58afiNGnLNbrTL6kSmoDF5pWPkCO75ZpfRU
 WtCCa/RW78mFXMGDE3VtEgtmDkNdI/TbdGRkJL4MfcXHrnuDPCXPly4B47YakiLBWM4zLS/uwaGzc
 w1QwlJsw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb3Xr-00G3mo-O8
 for linux-arm-kernel@lists.infradead.org; Mon, 26 Apr 2021 15:53:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7802A60FD9
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 26 Apr 2021 15:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619452390;
 bh=3xvN2At+w6IE8T1lkLL48cZrJG39528+LI4ee95/cvI=;
 h=From:Date:Subject:To:List-Id:Cc:From;
 b=HE/XQK8U1nsiwBSWbrMjkKddTNZyVkgJUzU3GAH9/C7iNGdCGKl4dEAFSY4QP0NJZ
 5693KPcuCZhEMKyEArj2GtHw+C05uu/t64hBtiQ2jDx88h9E5f+jjtQqBIhdlXrkdo
 PBiKSpsztunQgnM4xNyT/+rQkj0/HDM+v4nWDP70cRnYbgQX7QH7PQ/Y1wXLek9dNQ
 wmOPsbdx3lkD5FfZLRYUZBnewisOQSKtjY3MlEsXp9azOcFzQBp/4fIp4RiyKVyW77
 3RJdRG4cfnxqEz9XCzVtYJvHTXzVY6CxSHLJaP8Elo04nmP2ZsUCp+J94jaTqTB3a6
 g1cCJwvjoC1Yg==
Received: by mail-wr1-f48.google.com with SMTP id x7so56382743wrw.10
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 26 Apr 2021 08:53:10 -0700 (PDT)
X-Gm-Message-State: AOAM5338naVzdxCdJ9lrbXL1I3jHPVUzOoyUwFIh4Yu1zaG48MEyXATz
 /piOLCRQu/wgVJ0rd+wQDrfjq1ALpPHJUG5Jvz0=
X-Google-Smtp-Source: ABdhPJxwxYnxpReVhW98YZhCNqhQWeKcOAzDFQGh2f5hHxyuTG30Pi13wa1Li6TjTjip1BiTpGilTEhlLANdyEzTwDA=
X-Received: by 2002:adf:db4f:: with SMTP id f15mr23840851wrj.99.1619452388953; 
 Mon, 26 Apr 2021 08:53:08 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 26 Apr 2021 17:52:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
Message-ID: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
Subject: [GIT PULL 0/6] ARM SoC branches for 5.13
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_085311_893456_E1825C91 
X-CRM114-Status: GOOD (  11.98  )
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
Message-ID: <20210426155239.eud7ErhYRTDjfOLQmYAhQGtw-Nm2TFMQP9x5msIzoBA@z>

SGVyZSBhcmUgc2l4IGJyYW5jaGVzIGZvciB0aGUgU29DIHRyZWUgZm9yIHRoZSA1LjEzIG1lcmdl
IHdpbmRvdy4KVGhlcmUgYXJlIGEgY291cGxlCm9mIG5ldyBTb0NzIHRoaXMgdGltZSwgd2l0aCB0
aGUgaW5pdGlhbCBBcHBsZSBNMSBzdXBwb3J0IGJlaW5nIHRoZQptb3N0IGV4Y2l0aW5nIG9uZS4K
VGhlIFNUTTMySDc1MCBwbGF0Zm9ybSBpcyBhbHNvIG5vdGV3b3J0aHkgYmVjYXVzZSBpdCdzIGZh
aXJseQp1bmV4cGVjdGVkIHRvIHN0aWxsCnNlZSBuZXcgTU1VLWxlc3MgYm9hcmRzLgoKVGhlIGFy
bS1hcHBsZS1tMS01LjEzIHRhZyBpbmNsdWRlcyBjaGFuZ2VzIGZyb20gdGhlIHR0eSBhbmQgYXJt
NjQKdHJlZXMsIHNvIGl0IHdvdWxkCmJlIGdvb2QgdG8gbWVyZ2UgdGhvc2UgZmlyc3QgaW4gb3Jk
ZXIgdG8gZ2V0IGEgbmVhdGVyIGdpdCBoaXN0b3J5LgpCb3RoIGhhdmUgYmVlbgpzdWJtaXR0ZWQg
dG9kYXkgYnkgR3JlZyBhbmQgQ2F0YWxpbi4KCkFzIHVzdWFsLCB0aGUgY2hhbmdlcyBhcmUgbW9z
dGx5IGZvciBkZXZpY2V0cmVlIGZpbGVzLCBhc2lkZSBmcm9tIHRoZQpvbmdvaW5nIGNsZWFudXAK
d29yayB0byBvbWFwMiBhbmQgZHJpdmVyIHdvcmsgZm9yIHRlZ3JhIGFuZCBzb2NmcGdhLiAgQWJv
dXQgdHdvIHRoaXJkcwp0aGlzIG9mIHRoZQpvdmVyYWxsIGNoYW5nZXMgdGhpcyB0aW1lIGFyZSBm
b3IgNjQtYml0IG1hY2hpbmVzLCB3aGljaCBpcyBtb3JlIHRoYW4gdXN1YWwgYnV0CmZpdHMgaW4g
d2l0aCB0aGUgbG9uZy10ZXJtIHRyZW5kLgoKQSBmZXcgbW9yZSBzdGF0aXN0aWNzOiBUaGVyZSBh
cmUgODYzIG5vbi1tZXJnZSBjb21taXRzIHRoaXMgdGltZSwgZnJvbSAxOTUKYXV0aG9ycy4gVGhl
c2UgdHdlbnR5IHBlb3BsZSBoYXZlIGRvbmUgbW9yZSB0aGFuIHRlbiBjaGFuZ2VzIGVhY2g6Cgog
ICAgIDc5IFRvbnkgTGluZGdyZW4KICAgICA0NyBLcnp5c3p0b2YgS296bG93c2tpCiAgICAgMzgg
Q3Jpc3RpYW4gTWFydXNzaQogICAgIDI4IFZpbm9kIEtvdWwKICAgICAyOCBEbWl0cnkgT3NpcGVu
a28KICAgICAyMSBNYW5pdmFubmFuIFNhZGhhc2l2YW0KICAgICAxOCBIZWN0b3IgTWFydGluCiAg
ICAgMTggR2VlcnQgVXl0dGVyaG9ldmVuCiAgICAgMTggRG9uZyBBaXNoZW5nCiAgICAgMTggQXJu
ZCBCZXJnbWFubgogICAgIDE3IFNhaSBQcmFrYXNoIFJhbmphbgogICAgIDE3IFJhZmHFgiBNacWC
ZWNraQogICAgIDE1IEphZ2FuIFRla2kKICAgICAxMiBTdGVwaGVuIEJveWQKICAgICAxMiBOaWNv
bGFzIFNhZW56IEp1bGllbm5lCiAgICAgMTEgTGludXMgV2FsbGVpagogICAgIDExIEpvbmF0aGFu
IE5ldXNjaMOkZmVyCiAgICAgMTEgSGVpa28gU3R1ZWJuZXIKICAgICAxMSBFZGRpZSBKYW1lcwog
ICAgIDExIENodW5mZW5nIFl1bgoKVGhpcyBpcyB0aGUgdG90YWwgZGlmZnN0YXQ6CgogICAwLjYl
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vCiAgIDAuMiUgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyLwogICAwLjMlIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvCiAgIDAu
MiUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC8KICAgMC4yJSBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvCiAgIDEuNiUgRG9jdW1lbnRhdGlvbi9kcml2ZXIt
YXBpLwogIDIzLjElIGFyY2gvYXJtL2Jvb3QvZHRzLwogICAwLjUlIGFyY2gvYXJtL2NvbmZpZ3Mv
CiAgIDQuOCUgYXJjaC9hcm0vbWFjaC1vbWFwMi8KICAgMS4yJSBhcmNoL2FybS8KICAgMC4yJSBh
cmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci8KICAgMC44JSBhcmNoL2FybTY0L2Jvb3QvZHRz
L2FtbG9naWMvCiAgIDAuMyUgYXJjaC9hcm02NC9ib290L2R0cy9hcHBsZS8KICAgMC41JSBhcmNo
L2FybTY0L2Jvb3QvZHRzL2Jyb2FkY29tL2JjbTQ5MDgvCiAgIDguMSUgYXJjaC9hcm02NC9ib290
L2R0cy9mcmVlc2NhbGUvCiAgIDAuNiUgYXJjaC9hcm02NC9ib290L2R0cy9pbnRlbC8KICAgMC40
JSBhcmNoL2FybTY0L2Jvb3QvZHRzL21hcnZlbGwvCiAgIDMuMSUgYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay8KICAxNC40JSBhcmNoL2FybTY0L2Jvb3QvZHRzL3Fjb20vCiAgIDIuMyUgYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzLwogICAwLjglIGFyY2gvYXJtNjQvYm9vdC9kdHMvcm9j
a2NoaXAvCiAgIDguMyUgYXJjaC9hcm02NC9ib290L2R0cy90aS8KICAgMC4yJSBhcmNoL2FybTY0
L2luY2x1ZGUvYXNtLwogICAwLjIlIGFyY2gvYXJtNjQvCiAgIDAuMiUgZHJpdmVycy9idXMvCiAg
IDAuNCUgZHJpdmVycy9jbGsvCiAgIDAuMyUgZHJpdmVycy9jcHVmcmVxLwogICA5LjIlIGRyaXZl
cnMvZmlybXdhcmUvYXJtX3NjbWkvCiAgIDAuNiUgZHJpdmVycy9maXJtd2FyZS8KICAgMS43JSBk
cml2ZXJzL2lpby9jb21tb24vc2NtaV9zZW5zb3JzLwogICAyLjElIGRyaXZlcnMvaXJxY2hpcC8K
ICAgMS4yJSBkcml2ZXJzL21lbW9yeS90ZWdyYS8KICAgMC41JSBkcml2ZXJzL3B3bS8KICAgMC45
JSBkcml2ZXJzL3NvYy9mc2wvcWUvCiAgIDIuNSUgZHJpdmVycy9zb2MvbWVkaWF0ZWsvCiAgIDAu
NSUgZHJpdmVycy9zb2MvcWNvbS8KICAgMC41JSBkcml2ZXJzL3NvYy90ZWdyYS8KICAgMC4zJSBk
cml2ZXJzL3NvYy8KICAgMC40JSBkcml2ZXJzL3R0eS9zZXJpYWwvCiAgIDEuMiUgZHJpdmVycy8K
ICAgMS4zJSBpbmNsdWRlL2xpbnV4LwogICAwLjIlIGluY2x1ZGUvc29jLwogICAwLjIlIGluY2x1
ZGUvCiA3NzQgZmlsZXMgY2hhbmdlZCwgMzUyNDcgaW5zZXJ0aW9ucygrKSwgODA5MSBkZWxldGlv
bnMoLSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFybS1rZXJuZWwK
