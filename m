Return-Path: <SRS0=GSTU=FE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F26C63777
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 16:04:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 549E12076E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 16:04:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lf/95Z+X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 549E12076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oGOZT595j+d7lX3AEmAlcYYYjmq2RNm10c0ELfbHvIg=; b=lf/95Z+X7XqQCgEK1PPVJRXVy5
	mibnWYgdP6RsJ3NGKKdarYBqL4J4h8elnaf1O4+dx2LpMgGMYLifJPbsPv3IxD36ddbmOLDLK2a1v
	yEp3I6IoEnUNCp/NHPuBLE6GW/DkkvsUWgrMSNcoHAo+dNd5jaUnPl75DutnSv/25iLXyFHfibdYb
	fVNvTBYkexH55TX/IRI3Z+/W/NTtfO8yNf6xs4DLhztATz7NXUn8q3pwV14630pEXUzReQeW2uald
	LG3PgFRbldtyP7zJnmVlGP3favHIhHWz4q/sr86DEjxoGDGRTHAUQAZycH3UpRQcquHXzw5Q3N8xm
	nGxv75aQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjldq-0006xX-LZ; Mon, 30 Nov 2020 16:03:06 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjldm-0006vs-7a
 for linux-arm-kernel@lists.infradead.org; Mon, 30 Nov 2020 16:03:03 +0000
X-Originating-IP: 91.175.115.186
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
 (Authenticated sender: gregory.clement@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 5E6A9E0010;
 Mon, 30 Nov 2020 16:02:59 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Subject: [GIT PULL] ARM: mvebu: dt64 for v5.11 (#1)
Date: Mon, 30 Nov 2020 17:02:59 +0100
Message-ID: <87eekaj0i4.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_110302_486097_AA23034B 
X-CRM114-Status: GOOD (  15.04  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201130160259.dd5yG6iQJvM4fQv4i5V7uXRixwgf5INtGWqh92fXwQw@z>

SGksCgpIZXJlIGlzIHRoZSBmaXJzdCBwdWxsIHJlcXVlc3QgZm9yIGR0NjQgZm9yIG12ZWJ1IGZv
ciB2NS4xMS4KCkl0IGlzIGJhc2VkIG9uIHY1LjEwLXJjMiBiZWNhdXNlIHNvbWUgZml4ZXMgb24g
dGhlIGRldmljZSB0cmVlIGhhcyBiZWVuCm1lcmdlZCBhZnRlciB2NS4xMC1yYzEuCgpHcmVnb3J5
CgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDNjZWExMWNkNWUzYjAwZDkxY2Fm
MGI0NzMwMTk0MDM5YjQ1YzU4OTE6CgogIExpbnV4IDUuMTAtcmMyICgyMDIwLTExLTAxIDE0OjQz
OjUxIC0wODAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdp
dDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9nY2xlbWVudC9tdmVi
dS5naXQgdGFncy9tdmVidS1kdDY0LTUuMTEtMQoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVw
IHRvIGEyMDgxYzA5ZDc0MTBjM2U1NWQ5MDJhMDk2MDJiODMzZGM5NmM1OGE6CgogIGFybTY0OiBk
dHM6IGFybWFkYS0zNzIwLXR1cnJpcy1tb3g6IGFkZCAzVyBwb3dlciBjYXBhYmlsaXR5IHRvIFNG
UCBjYWdlICgyMDIwLTExLTMwIDE2OjQ2OjMwICswMTAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQptdmVidSBkdDY0IGZv
ciA1LjExIChwYXJ0IDEpCgogLSBBZGQgc3VwcG9ydCBmb3IgSUVJIFB1enpsZS1NODAxIGJvYXJk
IChBcm1hZGEgODA0MCBiYXNlZCkKIC0gQWRkIHN1cHBvcnQgRVNQUkVTU09iaW4tVWx0cmEgKEFy
bWFkYSAzNzIwIGJhc2VkKQogLSBDbGVhbi11cCBhbmQgaW1wcm92ZSBlc3ByZXNzb2JpbiBkZXZp
Y2UgdHJlZQogLSBTd2l0Y2ggdG8gcGVyLXBvcnQgU0FUQSBpbnRlcnJ1cHRzIG9uIENQMTEwIGJh
c2VkIFNvQwogLSBVc2UgY29tcGxpYW50IG5vZGUgbmFtZSBmb3IgVVNCMyAgb24gQ1AxMTAgYmFz
ZWQgU29DCiAtIEFkZCBoZWFydGJlYXQgTEVEIG9uIG1jYmluIHNpbmdsZXNob3QKIC0gRGlzYWJs
ZSBTTU1VIGJ5IGRlZmF1bHQgZm9yIEFybWFkYSA3MDQwIGFuZCA4MDQwIHRvIGNvbnRpbnVlZAog
ICBzdXBwb3J0aW5nIGN1c3RvbSBib3QgZmlybXdhcmUKIC0gVHVycmlzIG1veDoKICAgLSBhZGQg
M1cgcG93ZXIgY2FwYWJpbGl0eSB0byBTRlAgY2FnZQogICAtIHVwZGF0ZSBldGhlcm5ldC1waHkg
aGFuZGxlIG5hbWUKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KQW5kcmUgSGVpZGVyICgyKToKICAgICAgYXJtNjQ6IGR0czog
bWFydmVsbDogZXNwcmVzc29iaW46IFNpbXBsaWZ5IHY3IGV0aGVybmV0IHBvcnQgbGFiZWxpbmcK
ICAgICAgYXJtNjQ6IGR0czogbWFydmVsbDogZXNwcmVzc29iaW46IEdldCByaWQgb2YgZHVwbGlj
YXRlIHNlcmlhbCBhbGlhc2VzCgpMdWthIEtvdmFjaWMgKDEpOgogICAgICBhcm02NDogZHRzOiBt
YXJ2ZWxsOiBBZGQgYSBkZXZpY2UgdHJlZSBmb3IgdGhlIElFSSBQdXp6bGUtTTgwMSBib2FyZAoK
TWFyZWsgQmVow7puICgyKToKICAgICAgYXJtNjQ6IGR0czogYXJtYWRhLTM3MjAtdHVycmlzLW1v
eDogdXBkYXRlIGV0aGVybmV0LXBoeSBoYW5kbGUgbmFtZQogICAgICBhcm02NDogZHRzOiBhcm1h
ZGEtMzcyMC10dXJyaXMtbW94OiBhZGQgM1cgcG93ZXIgY2FwYWJpbGl0eSB0byBTRlAgY2FnZQoK
UGFsaSBSb2jDoXIgKDMpOgogICAgICBhcm02NDogZHRzOiBtYXJ2ZWxsOiBlc3ByZXNzb2Jpbjog
RGUtZHVwbGljYXRlIGVNTUMgZGVmaW5pdGlvbnMKICAgICAgYXJtNjQ6IGR0czogbWFydmVsbDog
ZXNwcmVzc29iaW46IEFkZCBzdXBwb3J0IGZvciBMRUQyCiAgICAgIGFybTY0OiBkdHM6IG1hcnZl
bGw6IGVzcHJlc3NvYmluOiBVcGRhdGUgbGluayB0byBWNyBzY2hlbWF0aWMKClNlcmdlIFNlbWlu
ICgxKToKICAgICAgYXJtNjQ6IGR0czogbWFydmVsbDogY3AxMXg6IEhhcm1vbml6ZSB4SENJIERU
IG5vZGVzIG5hbWUKClN2ZW4gQXVoYWdlbiAoMSk6CiAgICAgIGFybTY0OiBkdHM6IG1hcnZlbGw6
IGFybWFkYS1jcDExMDogU3dpdGNoIHRvIHBlci1wb3J0IFNBVEEgaW50ZXJydXB0cwoKVG9tYXN6
IE1hY2llaiBOb3dhayAoMSk6CiAgICAgIGFybTY0OiBkdHM6IG1jYmluLXNpbmdsZXNob3Q6IGFk
ZCBoZWFydGJlYXQgTEVECgpUb21hc3ogTm93aWNraSAoMSk6CiAgICAgIGFybTY0OiBkdHM6IG1h
cnZlbGw6IGtlZXAgU01NVSBkaXNhYmxlZCBieSBkZWZhdWx0IGZvciBBcm1hZGEgNzA0MCBhbmQg
ODA0MAoKVmxhZGltaXIgVmlkICgxKToKICAgICAgYXJtNjQ6IGR0czogbWFydmVsbDogYWRkIERU
IGZvciBFU1BSRVNTT2Jpbi1VbHRyYQoKIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWFydmVsbC9NYWtl
ZmlsZSAgICAgICAgICAgICAgIHwgICAyICsKIC4uLi9kdHMvbWFydmVsbC9hcm1hZGEtMzcyMC1l
c3ByZXNzb2Jpbi1lbW1jLmR0cyAgIHwgIDE4IC0KIC4uLi9kdHMvbWFydmVsbC9hcm1hZGEtMzcy
MC1lc3ByZXNzb2Jpbi11bHRyYS5kdHMgIHwgMTY1ICsrKysrKysKIC4uLi9tYXJ2ZWxsL2FybWFk
YS0zNzIwLWVzcHJlc3NvYmluLXY3LWVtbWMuZHRzICAgIHwgIDQwICstCiAuLi4vZHRzL21hcnZl
bGwvYXJtYWRhLTM3MjAtZXNwcmVzc29iaW4tdjcuZHRzICAgICB8ICAyNCArLQogLi4uL2Jvb3Qv
ZHRzL21hcnZlbGwvYXJtYWRhLTM3MjAtZXNwcmVzc29iaW4uZHRzaSAgfCAgMzkgKy0KIC4uLi9i
b290L2R0cy9tYXJ2ZWxsL2FybWFkYS0zNzIwLXR1cnJpcy1tb3guZHRzICAgIHwgICAzICstCiBh
cmNoL2FybTY0L2Jvb3QvZHRzL21hcnZlbGwvYXJtYWRhLTcwNDAuZHRzaSAgICAgICB8ICAgNCAt
CiAuLi4vZHRzL21hcnZlbGwvYXJtYWRhLTgwNDAtbWNiaW4tc2luZ2xlc2hvdC5kdHMgICB8ICAy
MiArCiAuLi4vYm9vdC9kdHMvbWFydmVsbC9hcm1hZGEtODA0MC1wdXp6bGUtbTgwMS5kdHMgICB8
IDUyMyArKysrKysrKysrKysrKysrKysrKysKIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWFydmVsbC9h
cm1hZGEtODA0MC5kdHNpICAgICAgIHwgICA0IC0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWFydmVs
bC9hcm1hZGEtY3AxMXguZHRzaSAgICAgIHwgIDEwICstCiAxMiBmaWxlcyBjaGFuZ2VkLCA3NzUg
aW5zZXJ0aW9ucygrKSwgNzkgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9h
cm02NC9ib290L2R0cy9tYXJ2ZWxsL2FybWFkYS0zNzIwLWVzcHJlc3NvYmluLXVsdHJhLmR0cwog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvbWFydmVsbC9hcm1hZGEtODA0
MC1wdXp6bGUtbTgwMS5kdHMKCi0tIApHcmVnb3J5IENsZW1lbnQsIEJvb3RsaW4KRW1iZWRkZWQg
TGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwOi8vYm9vdGxpbi5jb20KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwg
bWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
