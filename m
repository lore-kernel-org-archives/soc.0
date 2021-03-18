Return-Path: <SRS0=00CR=IQ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6F3C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Mar 2021 09:03:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0065F6148E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Mar 2021 09:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0065F6148E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LpQvS2qms/PjBrILQWXDTAl1x+8vrd+nTdU+kYoshkA=; b=F15vqtD4Etw5AFWen/YFamctvc
	La9uqgRDAs6ehQZWNi9B8+3gVaXiODPfcA3SH5UmGijO//JbNAB4R3Jx+JQfFsreencdbDDj6orXq
	TLhFQHb3ml1VtDfEhJEBrHEqlI9Qdg0LNdubsZknnduWeaZXt9IJiGL70T4+qQAHZcinz+dcW91+t
	6tGyqPWhkqmRsv9Mv6VIFnRiFTtET85GltyykwIddwsQnrV9R3M+l4XB6P8nbb4Lj63Lx1xrYClXK
	qM8JGgTAL1imjPn8LRL53y3kuSJ0lLqviKfWOUGQ6xYZfeTkV1sZ4wwVWd32f5uesz5qgPENf0ESF
	8E5rMAgw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMoXW-004qxc-0Q; Thu, 18 Mar 2021 09:01:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMoXQ-004qww-Fo
 for linux-arm-kernel@lists.infradead.org; Thu, 18 Mar 2021 09:01:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68D606148E;
 Thu, 18 Mar 2021 09:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616058111;
 bh=1CaeqjzTDN5MXdLj74768GDiTbrkvP1IB1LRx7ToJ74=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=cFxsACFFPTH4rfQU2VL9hLMGpKBfsphrLZiMMecjlx/84a7cLP1to2DvbVe2gaCnQ
 InQ+x4BkewCF0r2ufY6i1Lbn4T3o43vLulMyvVTYqkJZBDB1RonA+sj2/t81bGJpJP
 AAkG7Xxb1crMMLufg1itplrki1hetYhfpNkUEzxnyqw+PlK3SOF3p2Ga2lW4JnnpO5
 9uQ41OSe5BK9LWpYJx9MQnqP8K/IoKiIsv8Ze7PgSJ/kmBjfXYLAbPYTGid9sJVKdc
 YCMAIxm/dJBialCcW1ibJFGFae9HFtLLUvB/+z/fx/ra4Mc7cVRE91lvkZw/+DRWyn
 bQVzmLNbcdWDw==
Date: Thu, 18 Mar 2021 17:01:46 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
 Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
 linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.12
Message-ID: <20210318090145.GA22955@dragon>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_090152_929650_D39DB4E6 
X-CRM114-Status: GOOD (  10.66  )
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
Message-ID: <20210318090146.RFwEFWtDvGCGiuBRIfTtD4INBSNKfIebHal14lgnn9Y@z>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBhMzhmZDg3NDg0NjQ4MzE1ODRhMTk0
MzhjYmIzMDgyYjVhMmRhYjE1OgoKICBMaW51eCA1LjEyLXJjMiAoMjAyMS0wMy0wNSAxNzozMzo0
MSAtMDgwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc2hhd25ndW8vbGludXgu
Z2l0IHRhZ3MvaW14LWZpeGVzLTUuMTIKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBl
NDgxN2ExYjZiNzdkYjUzOGJjMDE0MWMzYjEzOGYyZGY4MDNjZTg3OgoKICBBUk06IGR0czogaW14
NnVsbDogZml4IHViaSBmaWxlc3lzdGVtIG1vdW50IGZhaWxlZCAoMjAyMS0wMy0xOCAxMjowNjoy
OCArMDgwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KaS5NWCBmaXhlcyBmb3IgNS4xMjoKCi0gRml4IGFuIEV0aGVybmV0
IGlzc3VlIG9uIGlteDZ1bC0xNHgxNC1ldmsgYm9hcmQgdGhhdCBpcyBjYXVzZWQgYnkKICBpbmRl
cGVuZGVudCBQSFkgcmVzZXQuCi0gQWRkIG1pc3NpbmcgYGRtYS1jb2hlcmVudGAgcHJvcGVydHkg
Zm9yIExheWVyU2NhcGUgZGV2aWNlIHRyZWVzIHRvIGZpeCBhCiAga2VybmVsIEJVRyByZXBvcnQu
Ci0gVXNlIElSUUNISVBfREVDTEFSRSBmb3IgQVZJQyBkcml2ZXIgdG8gZml4IGEgYm9vdCBpc3N1
ZSBvbiBpLk1YMjUgd2l0aAogIGZ3X2Rldmxpbms9b24uCi0gQWRkIG1pc3NpbmcgSTJDIHBpbmN0
cmwgZW50cnkgZm9yIGlteDhtcC1waHlib2FyZC1wb2xsdXgtcmRrIGJvYXJkIHRvCiAgZml4IHRo
ZSBicm9rZW4gSTJDIEdQSU8gcmVjb3Zlcnkgc3VwcG9ydC4KLSBBZGQgYGZzbCx1c2UtbWluaW11
bS1lY2NgIHByb3BlcnR5IGZvciBpbXg2dWxsLW15aXItbXlzLTZ1bHgtZXZhbAogIGRldmljZSB0
cmVlIHRvIGZpeCBVQkkgZmlsZXN5c3RlbSBtb3VudCBmYWlsdXJlLgoKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpGYWJpbyBF
c3RldmFtICgxKToKICAgICAgQVJNOiBpbXg2dWwtMTR4MTQtZXZrOiBEbyBub3QgcmVzZXQgdGhl
IEV0aGVybmV0IFBIWXMgaW5kZXBlbmRlbnRseQoKSG9yaWEgR2VhbnTEgyAoMyk6CiAgICAgIGFy
bTY0OiBkdHM6IGxzMTA0NmE6IG1hcmsgY3J5cHRvIGVuZ2luZSBkbWEgY29oZXJlbnQKICAgICAg
YXJtNjQ6IGR0czogbHMxMDQzYTogbWFyayBjcnlwdG8gZW5naW5lIGRtYSBjb2hlcmVudAogICAg
ICBhcm02NDogZHRzOiBsczEwMTJhOiBtYXJrIGNyeXB0byBlbmdpbmUgZG1hIGNvaGVyZW50CgpT
YXJhdmFuYSBLYW5uYW4gKDEpOgogICAgICBBUk06IGlteDogYXZpYzogQ29udmVydCB0byB1c2lu
ZyBJUlFDSElQX0RFQ0xBUkUKClRlcmVzYSBSZW1tZXQgKDEpOgogICAgICBhcm02NDogZHRzOiBp
bXg4bXAtcGh5Ym9hcmQtcG9sbHV4LXJkazogQWRkIG1pc3NpbmcgcGluY3RybCBlbnRyeQoKZGls
bG9uIG1pbiAoMSk6CiAgICAgIEFSTTogZHRzOiBpbXg2dWxsOiBmaXggdWJpIGZpbGVzeXN0ZW0g
bW91bnQgZmFpbGVkCgogYXJjaC9hcm0vYm9vdC9kdHMvaW14NnVsLTE0eDE0LWV2ay5kdHNpICAg
ICAgICAgICAgfCAyMiArKysrKysrKysrKysrKy0tLS0tLQogYXJjaC9hcm0vYm9vdC9kdHMvaW14
NnVsbC1teWlyLW15cy02dWx4LWV2YWwuZHRzICAgfCAgMSArCiBhcmNoL2FybS9tYWNoLWlteC9h
dmljLmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDE2ICsrKysrKysrKysrKysrLQogYXJj
aC9hcm0vbWFjaC1pbXgvY29tbW9uLmggICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAtCiBh
cmNoL2FybS9tYWNoLWlteC9tYWNoLWlteDEuYyAgICAgICAgICAgICAgICAgICAgICB8IDExIC0t
LS0tLS0tLS0KIGFyY2gvYXJtL21hY2gtaW14L21hY2gtaW14MjUuYyAgICAgICAgICAgICAgICAg
ICAgIHwgMTIgLS0tLS0tLS0tLS0KIGFyY2gvYXJtL21hY2gtaW14L21hY2gtaW14MjcuYyAgICAg
ICAgICAgICAgICAgICAgIHwgMTIgLS0tLS0tLS0tLS0KIGFyY2gvYXJtL21hY2gtaW14L21hY2gt
aW14MzEuYyAgICAgICAgICAgICAgICAgICAgIHwgIDEgLQogYXJjaC9hcm0vbWFjaC1pbXgvbWFj
aC1pbXgzNS5jICAgICAgICAgICAgICAgICAgICAgfCAgMSAtCiBhcmNoL2FybS9tYWNoLWlteC9t
bS1pbXgzLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDI0IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczEwMTJhLmR0c2kgICAgIHwg
IDEgKwogYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMTA0M2EuZHRzaSAgICAg
fCAgMSArCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMxMDQ2YS5kdHNpICAg
ICB8ICAxICsKIC4uLi9kdHMvZnJlZXNjYWxlL2lteDhtcC1waHlib2FyZC1wb2xsdXgtcmRrLmR0
cyAgIHwgIDIgKy0KIC4uLi9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1wLXBoeWNvcmUtc29tLmR0
c2kgICAgIHwgIDIgKy0KIDE1IGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDcxIGRl
bGV0aW9ucygtKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYXJtLWtlcm5lbAo=
