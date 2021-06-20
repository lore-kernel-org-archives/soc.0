Return-Path: <SRS0=Ogrm=LO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F00C48BDF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jun 2021 08:52:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 499ED61059
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jun 2021 08:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 499ED61059
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iK17XE1CdAyQlh9NaLU9E3IgIIj+h9TUzRmeVAuFSkg=; b=VrSvfHwWVzoptk
	I+78ok1vOhxezNA/cE8xPEXZ72TW8iNevjDEmCxLbQapZGq96gDA0UWiHg2VQVbGoMl3DYiic5W++
	iGw9H5TeoYcRsv+HV+FiwhVR5GnGWKp95jij5eVFH8zoQfPRNPxyxKRRgA+PuJus3E9bc/lcPKDhJ
	4QCvmuPZVi9wlmFd3hRHM+GtzgSHo8/Ue1UClBocxJT4F//Fup1ZnofSDbGUUTHwAL9gwX+l8OJ6E
	bLf0eEDZsfii2LwGyxEY7n+jsvXsTzqS+XGh+9pBW0rueHQElC1sLGai72k3QTGfGHdms2zgKyKiD
	qD1rRzI4ne/DnkhGXioQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lutAw-000jmO-OW; Sun, 20 Jun 2021 08:51:30 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lutAr-000jlx-QM
 for linux-arm-kernel@lists.infradead.org; Sun, 20 Jun 2021 08:51:28 +0000
Received: (Authenticated sender: gregory.clement@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 7C34E1C0005;
 Sun, 20 Jun 2021 08:51:21 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: drivers for v5.14 (#1)
Date: Sun, 20 Jun 2021 10:51:22 +0200
Message-ID: <87bl802a2d.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_015126_030112_027F652F 
X-CRM114-Status: UNSURE (   5.50  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210620085122.5UGsgsqKLxzi1Q9vrPsWIbxjwB3HVGm6AaibXDPflmQ@z>

SGksCgpIZXJlIGlzIHRoZSBmaXJzdCBwdWxsIHJlcXVlc3QgZm9yIGRyaXZlcnMgZm9yIG12ZWJ1
IGZvciB2NS4xNC4KCkdyZWdvcnkKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQg
NmVmYjk0M2I4NjE2ZWM1M2E1ZTQ0NDE5M2RjY2YxYWY5YWQ2MjdiNToKCiAgTGludXggNS4xMy1y
YzEgKDIwMjEtMDUtMDkgMTQ6MTc6NDQgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQg
cmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L2djbGVtZW50L212ZWJ1LmdpdCB0YWdzL212ZWJ1LWRyaXZlcnMtNS4xNC0xCgpmb3Ig
eW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gOTBhZTQ3MjE1ZGUzZmVjODYyYWViMWEwZjBlMjhi
YjUwNWFiMTM1MToKCiAgZmlybXdhcmU6IHR1cnJpcy1tb3gtcnd0bTogYWRkIG1hcnZlbGwsYXJt
YWRhLTM3MDAtcnd0bS1maXJtd2FyZSBjb21wYXRpYmxlIHN0cmluZyAoMjAyMS0wNi0xNyAxNTow
MjozNSArMDIwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KbXZlYnUgZHJpdmVycyBmb3IgNS4xNCAocGFydCAxKQoKTWFr
ZSB0aGUgdHVycmlzIG1veCByd3RtIGZpcm13YXJlIG1vcmUgZ2VuZXJpYyBmb3IgQXJtYWRhIDM3
MDAgU29DcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQpQYWxpIFJvaMOhciAoMSk6CiAgICAgIGZpcm13YXJlOiB0dXJyaXMt
bW94LXJ3dG06IGFkZCBtYXJ2ZWxsLGFybWFkYS0zNzAwLXJ3dG0tZmlybXdhcmUgY29tcGF0aWJs
ZSBzdHJpbmcKCiBkcml2ZXJzL2Zpcm13YXJlL3R1cnJpcy1tb3gtcnd0bS5jIHwgMSArCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCi0tIApHcmVnb3J5IENsZW1lbnQsIEJvb3RsaW4K
RW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwOi8vYm9vdGxpbi5jb20K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFy
bS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1r
ZXJuZWwK
