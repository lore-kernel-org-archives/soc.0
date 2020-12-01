Return-Path: <SRS0=r2Hb=FF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A587CC64E7A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 20:46:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C67E20679
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 20:46:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SwAUPwkM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="d78RAluW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C67E20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MTaeLRHEF9kp156EzxS00n0eGuPMXpfU1vOD07u7l7w=; b=SwAUPwkMFRltIKkCCE9IPxoHT
	fqYfHpUv2Ph2cw7JSrLh9oQB0WGWkh8elW2hhSmhgFgZnJlN0kXa3wxLRx8t8Ko5LRcNZaMXmRR54
	sHRKZ/DEpmyD9BOzPcE30yy/R1Q6AvTmfmg41awzm184OAb+HxwmTgSbDA1KTTZlxXBA1dkkCkvmw
	TLoTmYWKX7ENRAx3LUJowoWDDtzfpUjQDg8lUGNX79Jia+qUnMEpGyG2YGt7fMe+sFn7MJ1enUKHF
	1lvEkeDV46oH5AshBYAXJ8q+byq7ckjeXahDfImuKVfFqgWQsizVHNdH5LY0OIcZL8usAz5SFgr/A
	3DkalZ9Hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkCW4-0007If-Gr; Tue, 01 Dec 2020 20:44:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkCVz-0007H9-PE
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 20:44:48 +0000
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4DB5421D42;
 Tue,  1 Dec 2020 20:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606855486;
 bh=27tCpQcWOs4tSngGp9vXEG4BIPRYRzE0lDdLeMC9nhk=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d78RAluWg3tIjuQZyCTjFMS1Wvmp5SfWWCg/vuTOeC8OsPoAiE8UyGEaiwYhCCJzm
 7IqeRWusLN9Wdhq5CY6NZQBW8A1Xwf9avC1f5PlrzOvP0DK1KexifWLYaPDZt6K0lK
 KrNQiXm3CMeb2kzWBdgiRMmDBCSx5yIesjFMwZqY=
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Subject: [GIT PULL 2/4] ARM: dts: samsung for v5.11
Date: Tue,  1 Dec 2020 22:44:02 +0200
Message-ID: <20201201204404.22675-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201201204404.22675-1-krzk@kernel.org>
References: <20201201204404.22675-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_154447_966994_F2C0D766 
X-CRM114-Status: GOOD (  15.91  )
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201201204402.rMv4s_1Zxz_S-Yd4efc5WVZ72V_UAcXIsaZi7ZvYYZA@z>

SGksCgpTYW1zdW5nIGNoYW5nZXMsIG9uIHRvcCBvZiBwcmV2aW91cyBwdWxsIHJlcXVlc3QuCgpC
ZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21t
aXQgNzNmODgyYTBmM2E4MzNkNTg5YzFhMGI2YjgzMDQ1NTY3MjQ0ZTcxZToKCiAgQVJNOiBkdHM6
IGV4eW5vczogdXNlIGh5cGhlbnMgaW4gTUZDIHJlc2VydmVkIG1lbW9yeSBub2RlIG5hbWVzICgy
MDIwLTExLTEwIDE5OjIxOjIxICswMTAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9z
aXRvcnkgYXQ6CgogIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2tyemsvbGludXguZ2l0IHRhZ3Mvc2Ftc3VuZy1kdC01LjExLTIKCmZvciB5b3UgdG8gZmV0
Y2ggY2hhbmdlcyB1cCB0byBhZmJkMGJkZWJlMGQ4MmM0ODQ2ZGJiY2U1MzYyNTExMDg4OWM1ZGU4
OgoKICBBUk06IGR0czogZXh5bm9zOiBzd2l0Y2ggQXRtZWwgbXh0IHJlc2V0IEdQSU8gdG8gYWN0
aXZlIGxvdyBvbiBQNCBOb3RlICgyMDIwLTExLTIyIDEyOjM2OjExICswMTAwKQoKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpT
YW1zdW5nIERUUyBBUk0gY2hhbmdlcyBmb3IgdjUuMTEsIHBhcnQgdHdvCgoxLiBBZGQgZGV2aWNl
dHJlZSBvZiBTYW1zdW5nIEdhbGF4eSBOb3RlIDEwLjEgdGFibGV0cwogICAoR1QtTjgwMTAvR1Qt
TjgwMTMpLCBjYWxsZWQgUDQgTm90ZS4gIFRoZXNlIGFyZSBxdWl0ZSBvbGQgYnV0CiAgIHN0aWxs
IGZ1bmN0aW9uYWwgZGV2aWNlcywgYmFzZWQgb24gRXh5bm9zNDQxMi4KMi4gTWlub3IgY2xlYW51
cHMgaW4gT2Ryb2lkIFhVMyBFdGhlcm5ldC4KMy4gTWlub3IgZml4ZXM6IEFEQyBpby1jaGFubmVs
LXJhbmdlcyBhbmQgUDQgTm90ZSB0b3VjaHNjcmVlbiBHUElPCiAgIHBvbGFyaXR5LgoKLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQpKb25hdGhhbiBDYW1lcm9uICgzKToKICAgICAgQVJNOiBkdHM6IGV4eW5vczogRHJvcCBpbmNv
cnJlY3QgdXNlIG9mIGlvLWNoYW5uZWwtcmFuZ2VzCiAgICAgIEFSTTogZHRzOiBzNXB2MjEwOiBE
cm9wIGluY29ycmVjdCB1c2Ugb2YgaW8tY2hhbm5lbC1yYW5nZXMgcHJvcGVydHkKICAgICAgQVJN
OiBkdHM6IHM1cHYyMTA6IERyb3AgdW5uZWVkZWQgaW8tY2hhbm5lbC1yYW5nZXMgcHJvcGVydHkg
aW4gQXJpZXMKCk1hcnRpbiBKw7xja2VyICgzKToKICAgICAgZHQtYmluZGluZ3M6IGFybTogc2Ft
c3VuZzogZG9jdW1lbnQgYmluZGluZ3MgZm9yIFA0IE5vdGUgZmFtaWx5IGJvYXJkCiAgICAgIEFS
TTogZHRzOiBleHlub3M6IGFkZCBTYW1zdW5nJ3MgRXh5bm9zNDQxMi1iYXNlZCBQNCBOb3RlIGJv
YXJkcwogICAgICBBUk06IGR0czogZXh5bm9zOiBzd2l0Y2ggQXRtZWwgbXh0IHJlc2V0IEdQSU8g
dG8gYWN0aXZlIGxvdyBvbiBQNCBOb3RlCgrFgXVrYXN6IFN0ZWxtYWNoICgyKToKICAgICAgQVJN
OiBkdHM6IGV4eW5vczogRml4IEV0aGVybmV0IGludGVyZmFjZSBkZXNjcmlwdGlvbiBvbiBPZHJv
aWQgWFUzCiAgICAgIEFSTTogZHRzOiBleHlub3M6IEFkZCBhbiBhbGlhcyBmb3IgdGhlIEV0aGVy
bmV0IGludGVyZmFjZSBvbiBPZHJvaWQgWFUzCgogLi4uL2JpbmRpbmdzL2FybS9zYW1zdW5nL3Nh
bXN1bmctYm9hcmRzLnlhbWwgICAgICAgfCAgICA4ICsKIGFyY2gvYXJtL2Jvb3QvZHRzL01ha2Vm
aWxlICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMSArCiBhcmNoL2FybS9ib290L2R0cy9l
eHlub3MzMjUwLmR0c2kgICAgICAgICAgICAgICAgICB8ICAgIDEgLQogYXJjaC9hcm0vYm9vdC9k
dHMvZXh5bm9zNDQxMi1wNG5vdGUtbjgwMTAuZHRzICAgICAgfCAgIDE3ICsKIGFyY2gvYXJtL2Jv
b3QvZHRzL2V4eW5vczQ0MTItcDRub3RlLmR0c2kgICAgICAgICAgIHwgMTEzMiArKysrKysrKysr
KysrKysrKysrKwogYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpICAgICAgICAgICAg
ICAgICAgfCAgICAxIC0KIGFyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczUyNTAuZHRzaSAgICAgICAg
ICAgICAgICAgIHwgICAgMSAtCiBhcmNoL2FybS9ib290L2R0cy9leHlub3M1NDIyLW9kcm9pZHh1
My5kdHMgICAgICAgICB8ICAgIDggKy0KIGFyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczU0eHguZHRz
aSAgICAgICAgICAgICAgICAgIHwgICAgMSAtCiBhcmNoL2FybS9ib290L2R0cy9zNXB2MjEwLWFy
aWVzLmR0c2kgICAgICAgICAgICAgICB8ICAgIDEgLQogYXJjaC9hcm0vYm9vdC9kdHMvczVwdjIx
MC5kdHNpICAgICAgICAgICAgICAgICAgICAgfCAgICAxIC0KIDExIGZpbGVzIGNoYW5nZWQsIDEx
NjQgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNo
L2FybS9ib290L2R0cy9leHlub3M0NDEyLXA0bm90ZS1uODAxMC5kdHMKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBhcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLXA0bm90ZS5kdHNpCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1h
aWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
